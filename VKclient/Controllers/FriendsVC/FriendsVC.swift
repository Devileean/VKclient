//
//  FriendsVC.swift
//  VKclient
//
//  Created by Алексей Логинов on 19.06.2022.
//

import UIKit

class FriendsVC: UIViewController {

    @IBOutlet weak var friendsSearchBar: UISearchBar!
    @IBOutlet weak var friendsTableView: UITableView!
    var friends = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//extension FriendsVC: UITableViewDelegate {
//
//}
//
//extension FriendsVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard
//            let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? FriendsCell
//                else {return UITableViewCell()
//            }
//        return cell
//    }
    
    
//}
