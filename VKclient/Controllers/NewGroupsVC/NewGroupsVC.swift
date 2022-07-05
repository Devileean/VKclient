//
//  NewGroupsVC.swift
//  VKclient
//
//  Created by Алексей Логинов on 06.07.2022.
//

import UIKit

class NewGroupsVC: UIViewController {

    //MARK: Variables
    
    var newGroups: [GroupModel] = []
    
    
    
    
    
    @IBOutlet weak var newGroupsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = GroupsStorage()
        newGroups = storage.groupFilling
        
        newGroupsTableView.delegate = self
        newGroupsTableView.dataSource = self
        
        newGroupsTableView.register(UINib(nibName: "NewGroupCell", bundle: nil), forCellReuseIdentifier: "NewGroupID")

    }

}

extension NewGroupsVC: UITableViewDelegate {
    
}

extension NewGroupsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewGroupID", for: indexPath) as? NewGroupCell
        else {
            return UITableViewCell()
        }
        
        let groups = newGroups[indexPath.row]
        cell.configure(groupFilling: groups)
        return cell
    }
}

