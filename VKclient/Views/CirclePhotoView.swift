//
//  CirclePhotoView.swift
//  VKclient
//
//  Created by Алексей Логинов on 04.07.2022.
//

import UIKit

class CirclePhotoView: UIView {

    let avatarDisign = FriendsCell()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI() {
        let cornerRadius = self.frame.width / 2
        
        
        layer.cornerRadius = cornerRadius
        layer.shadowColor = #colorLiteral(red: 0.3077512383, green: 0.4815763831, blue: 0.7451851964, alpha: 1)
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 1.0
        //рамка
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.0
    }
    
}
