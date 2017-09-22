//
//  ViewController.swift
//  week-firebase
//
//  Created by Tanut.leel on 2/8/2560 BE.
//  Copyright © 2560 BE Tanut Leelaparsert. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    var ref : FIRDatabaseReference!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func reAction(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: txtEmail.text!, password: txtPassword.text!){(user,error) in
            if error != nil{
                
            }
            else {
                self.ref = FIRDatabase.database().reference(withPath: "Member")
                let memberData = member(name:self.txtName.text!,email:self.txtEmail.text!,username:self.txtUsername.text!)
                let memberRefItem = self.ref.child(self.txtUsername.text!)
                memberRefItem.setValue(memberData.toAnyObject())
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

