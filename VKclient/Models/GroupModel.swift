//
//  GroupModel.swift
//  VKclient
//
//  Created by Алексей Логинов on 01.07.2022.
//

import Foundation

class GroupModel {
    let headerGroup      : String
    let groupLogoImage   : String
    let foundingDateGroup: String
    
    init (
          headerGroup      : String,
          groupLogoImage   : String,
          foundingDateGroup: String){
            
            self.headerGroup       = headerGroup
            self.groupLogoImage    = groupLogoImage
            self.foundingDateGroup = foundingDateGroup
    }
}
