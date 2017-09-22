//
//  LoginViewController.swift
//  week-firebase
//
//  Created by Tanut on 2/15/2560 BE.
//  Copyright © 2560 Tanut Leelaparsert. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPw: UITextField!
    
    @IBAction func actionLogin(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: txtUser.text!, password: txtPw.text!){ (user, error) in
            if error != nil {
                let mainView = self.storyboard?.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
                self.present(mainView, animated: true, completion: nil)
            }else {
                let alert = UIAlertView(title: "Failed", message: nil, delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }

    func forgetPW(email:String){
        FIRAuth.auth()?.sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                let alert = UIAlertView(title: "Success", message: "Please Check Email", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            } else {
                let alert = UIAlertView(title: "Fail", message: "Not Found", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }

    @IBAction func actionForget(_ sender: Any) {
        let alert = UIAlertController(title: "Forget Password", message: "Please Enter Your E-mail", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(textField) -> Void in
            textField.placeholder = "Please Enter Your E-mail"
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            let textField = (alert.textFields![0]) as UITextField
            self.forgetPW(email: textField.text!)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {(action) -> Void in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
