//
//  MyGroupsVC.swift
//  VKclient
//
//  Created by Алексей Логинов on 19.06.2022.
//

import UIKit

class MyGroupsVC: UIViewController {
    
    @IBOutlet private var myGroupsTableView: UITableView!
    var groups : [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = GroupsStorage()
        groups = storage.groupFilling
        
        myGroupsTableView.delegate = self
        myGroupsTableView.dataSource = self
        
        myGroupsTableView.register(UINib(nibName: "MyGroupsCell", bundle: nil), forCellReuseIdentifier: "myGroupsID")
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "moveToMyGroups" {
//        }
//    }
    //делаем добавление групп
    

    @IBAction func addGroup(_ segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addGroups",
            let sourceController = segue.source as? NewGroupsVC,
            let indexPath = sourceController.newGroupsTableView.indexPathForSelectedRow
        else {
            return
        }
        let group = sourceController.newGroups[indexPath.row]
        
        // проверка на повторные группы, CONTAINS - метод высшего порядка(ПРО НИХ ВСЕ ПРОЧИТАТЬ!!!!)
        
        if !groups.contains(where: {$0.headerGroup == group.headerGroup}) {
            groups.append(group)
            
            //обновляем таблицу
           myGroupsTableView.reloadData()
       }
    }
}
extension MyGroupsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsID", for: indexPath) as? MyGroupsCell
        else {
            return UITableViewCell()
        }
        
        let groups = groups[indexPath.row]
        cell.configure(groupFilling: groups)
        return cell
    }

    // удаление групп:
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка УДАЛИТЬ
        if editingStyle == .delete {
            // Удаляем группу
            groups.remove(at: indexPath.row)
            // Удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


extension MyGroupsVC: UITableViewDelegate {

//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    performSegue(withIdentifier: "moveToMyGroups", sender: nil)
//}

}
