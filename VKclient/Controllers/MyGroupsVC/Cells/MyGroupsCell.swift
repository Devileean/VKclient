//
//  MyGroupsCell.swift
//  VKclient
//
//  Created by Алексей Логинов on 06.07.2022.
//

import UIKit

class MyGroupsCell: UITableViewCell {
 
    
    @IBOutlet weak var logoImageGroup: UIImageView!
    @IBOutlet weak var nameMyGroupsLabel: UILabel!
    @IBOutlet weak var discriptionTextView: UITextView!
    
func configure(groupFilling: GroupModel) {

    logoImageGroup.image        = UIImage(named: groupFilling.groupLogoImage)
    nameMyGroupsLabel.text         = groupFilling.headerGroup
    discriptionTextView.text = groupFilling.foundingDateGroup
}

}
