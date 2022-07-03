//
//  UserModel.swift
//  VKclient
//
//  Created by Алексей Логинов on 01.07.2022.
//

import Foundation


class UserModel  {
    let userFirstName:       String
    let userSecondName:      String
    let userAvatar:          String
    let dateUserBorn:        String
    //let userFotoCollection: [String]
    
    init(userFirstName:       String,
         userSecondName:      String,
         userAvatar:          String,
         dateUserBorn:        String
         //userFotoCollection: [String]
    ) {
        
        self.userFirstName      = userFirstName
        self.userSecondName     = userSecondName
        self.userAvatar         = userAvatar
        self.dateUserBorn       = dateUserBorn
        //self.userFotoCollection = userFotoCollection
    }
}
