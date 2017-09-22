//
//  ProfileViewController.swift
//  week-firebase
//
//  Created by Tanut on 2/15/2560 BE.
//  Copyright © 2560 Tanut Leelaparsert. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var ref = FIRDatabase.database().reference(withPath: "Member")
    var dataMember = [member]()
    
    func fetchData(){
        ref.observe(.value, with: { snapshot in
            var memberArr = [member]()
            for item in snapshot.children{
                let memberTemp = member(snapshot: item as! FIRDataSnapshot)
                memberArr.append(memberTemp)
            }
            self.dataMember = memberArr
            self.tableview.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ProfileViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMember.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = dataMember[indexPath.row].name
        cell.detailTextLabel?.text = dataMember[indexPath.row].email
        return cell
    }
    
}
