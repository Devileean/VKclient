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
    
    var friendsArray: [UserModel] = []
    var friendsSection = [[UserModel]]()
    
    private var firstLetters: [String] = []

    //MARK: LifeCircle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage  = UserStorage()
        friendsArray = storage.users
        firstLetters = getFirstLetters(storage.users)
        friendsSection = sortedForSection(storage.users, firstLetters: firstLetters)
        
        
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        
        //регистрируем ячейку чтобы она отображалась в таблице
        friendsTableView.register(UINib(nibName: "FriendsCell", bundle: nil), forCellReuseIdentifier: "FriendsCellXib")
    }
}

// достаём первую букву из фамилий друзей
private func getFirstLetters(_ users: [UserModel]) -> [String] {
    let friendsName = users.map { $0.userSecondName }
    let firstLetters = Array(Set(friendsName.map { String($0.prefix(1)) })).sorted()
    return firstLetters
}
// сортируем буквы
private func sortedForSection(_ users: [UserModel], firstLetters: [String]) -> [[UserModel]] {
    var friendsSorted: [[UserModel]] = []
    firstLetters.forEach { letter in
        let friendsForLetter = users.filter { String($0.userSecondName.prefix(1)) == letter}
        friendsSorted.append(friendsForLetter)
    }
    return friendsSorted
}

    //MARK: UITableViewDelegate
extension FriendsVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        friendsSection.count
        }

}


    //MARK: UITableViewDataSource
extension FriendsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsSection[section].count
    }
    
    // размещаем наш FriendsCell xib
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCellXib", for: indexPath) as? FriendsCell
                else {return UITableViewCell()
        }
        let friends = friendsSection[indexPath.section][indexPath.row]
        cell.configure(user: friends)
        return cell
    }
    
    //Чтобы отобразить заголовок  в каждом разделе, реализуйте метод tableview(_:titleForHeaderInSection:).
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return firstLetters[section]
        
    }

    //Чтобы добавить индексированное табличное представление, реализуйте метод sectionIndexTitles(for:).
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return firstLetters
    }
    
    // Вызовите метод willDisplayHeaderView в TableViewController классе
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    // Создаём константу, именна через неё мы будем обращаться к свойствам и изменять их
    let header = view as! UITableViewHeaderFooterView //Footer
    // Установить цвет текста в label
    header.textLabel?.textColor = .white
    // Установить цвет фона для секции
        header.tintColor =  #colorLiteral(red: 0.3077512383, green: 0.4815763831, blue: 0.7451851964, alpha: 1)
    // Установить шрифт и размер шрифта для label
   // header.textLabel?.font = UIFont(name: "Helvetica-Regular", size: 25)
    }
}
