//
//  MyGroupsCell.swift
//  VKclient
//
//  Created by Алексей Логинов on 29.06.2022.
//

import UIKit

class NewGroupCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel:           UILabel!
    @IBOutlet weak var groupLogoImage:           UIImageView!
    @IBOutlet weak var groupDescriptionTextView: UITextView!
    @IBOutlet weak var foundingDateGroupLabel:   UILabel!
    
    
    
    func configure(groupFilling: GroupModel) {

        groupLogoImage.image        = UIImage(named: groupFilling.groupLogoImage)
        groupNameLabel.text         = groupFilling.headerGroup
        foundingDateGroupLabel.text = groupFilling.foundingDateGroup
    }
}
