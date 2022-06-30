//
//  MyGroupsCell.swift
//  VKclient
//
//  Created by Алексей Логинов on 29.06.2022.
//

import UIKit

class MyGroupsCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupLogoImage: UIImageView!
    @IBOutlet weak var groupDescriptionTextView: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
