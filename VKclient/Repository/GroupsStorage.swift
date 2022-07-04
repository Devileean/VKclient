//
//  GroupsStorage.swift
//  VKclient
//
//  Created by Алексей Логинов on 01.07.2022.
//

import Foundation
    
class GroupsStorage {
    let groupFilling : [GroupModel]
    
    init() {
        groupFilling = [
        GroupModel(headerGroup: "Охота", groupLogoImage: "ohota", foundingDateGroup: "21.11.2010"),
        GroupModel(headerGroup: "Кино", groupLogoImage: "coi", foundingDateGroup: "05.10.2021"),
        GroupModel(headerGroup: "Geek Brains", groupLogoImage: "gk", foundingDateGroup: "11.05.2019")
    ]
    }
}
