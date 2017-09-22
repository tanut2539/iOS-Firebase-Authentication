//
//  member.swift
//  MobileClass
//
//  Created by iBook on 2/5/17.
//  Copyright © 2017 saranya kerdkhao. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class member{
    let key: String
    var name : String!
    var email : String!
    var username : String!
    var completed: Bool!
    let ref: FIRDatabaseReference!
    init(name: String, email: String,username: String, key: String = "") {
        self.key = key
        self.name = name
        self.email = email
        self.username = username
        self.ref = nil
    }
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        email = snapshotValue["email"] as! String
        //username = snapshotValue["username"] as! String
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return [
            "name": name,
            "email": email
            //"username": username
        ]
    }
}



