//
//  UserStorage.swift
//  VKclient
//
//  Created by Алексей Логинов on 01.07.2022.
//

import Foundation

class UserStorage {
    let users: [UserModel]
    
    init() {
        users = [
            UserModel(userFirstName: "Леонардо", userSecondName: "Ди Каприо", userAvatar: "leonardo", dateUserBorn: "11.11.1974"),
            UserModel(userFirstName: "Сандра", userSecondName: "Буллок", userAvatar: "sandrabullock", dateUserBorn: "26.07.1964"),
            UserModel(userFirstName: "Анджелина", userSecondName: "Джоли", userAvatar: "AnDgoli", dateUserBorn: "04.06.1975"),
            UserModel(userFirstName: "Дауни", userSecondName: "Роберт(младший)", userAvatar: "robertdauni", dateUserBorn: "04.04.1965")
        ]
    }
}
