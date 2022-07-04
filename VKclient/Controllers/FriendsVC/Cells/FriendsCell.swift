//
//  FriendsCell.swift
//  VKclient
//
//  Created by Алексей Логинов on 04.07.2022.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var firstNameUser:   UILabel!
    @IBOutlet weak var secondNameUser:  UILabel!
    @IBOutlet weak var dateBornUser:    UILabel!
        
        
        func configure(user: UserModel) {

        userAvatarImage.image = UIImage(named: user.userAvatar)
        firstNameUser.text    = user.userFirstName
        secondNameUser.text   = user.userSecondName
        dateBornUser.text     = user.dateUserBorn

            //backRoundView.backgroundColor = .lightGray
        }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cornerRadius = avatarView.frame.width / 2
        
        userAvatarImage.layer.cornerRadius = cornerRadius
        userAvatarImage.clipsToBounds = true
    }
        
}
