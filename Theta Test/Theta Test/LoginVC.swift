//
//  ViewController.swift
//  Theta Test
//
//  Created by Sourav Swain on 31/01/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var lbl_userNameTitle: UILabel!
    @IBOutlet weak var txt_userNameValue: UITextField!
    @IBOutlet weak var lbl_passwordTitle: UILabel!
    @IBOutlet weak var txt_passwordValue: UITextField!
    @IBOutlet weak var btn_eye: UIButton!
    @IBOutlet weak var btn_login: UIButton!
    
    let trueUserName:String = "Theta User"
    let truePassword:String = "Theta$1234"
    var isPasswordVisible:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Login"
    }

    //Eye button function
    func eyeButtonClicked(){
        if self.isPasswordVisible{
            self.btn_eye.isSelected = true
            self.txt_passwordValue.isSecureTextEntry = false
        }else{
            self.btn_eye.isSelected = false
            self.txt_passwordValue.isSecureTextEntry = true
        }
    }
    
    func evaluateLogin(uName:String, pWord:String){
        if uName == "" {
            SharedClass.sharedInstance.alert(view: self, title: "Username is required!", message: "Please enter your username.")
        }else if pWord == "" {
            SharedClass.sharedInstance.alert(view: self, title: "Password is required!", message: "Please enter your password.")
        }else{
            if uName != self.trueUserName {
                SharedClass.sharedInstance.alert(view: self, title: "Wrong username!", message: "Please enter correct username.")
            }else if pWord != self.truePassword {
                SharedClass.sharedInstance.alert(view: self, title: "Wrong Password!", message: "Please enter correct Password.")
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if sender == self.btn_eye {
            self.isPasswordVisible.toggle()
            self.eyeButtonClicked()
        }else if sender == self.btn_login{
            let username = self.txt_userNameValue.text ?? ""
            let password = self.txt_passwordValue.text ?? ""
            self.evaluateLogin(uName: username, pWord: password)
        }else{
            //Unassigned buttons
        }
    }
    
}

