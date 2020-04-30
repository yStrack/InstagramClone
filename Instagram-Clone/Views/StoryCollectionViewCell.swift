//
//  StoryCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by Yuri Strack on 30/04/20.
//  Copyright © 2020 Yuri Strack. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var auxView: UIView!
    @IBOutlet weak var storiesImage: UIImageView!
    
    
    func configCell(){
        storiesImage.layer.borderWidth = 5;
        storiesImage.layer.borderColor = UIColor.white.cgColor
        storiesImage.layer.cornerRadius = 30
        storiesImage.layer.masksToBounds = true
        storiesImage.clipsToBounds = true
        storiesImage.layer.cornerRadius = storiesImage.frame.size.height/2

        auxView.clipsToBounds = true
        auxView.layer.masksToBounds = true
        auxView.layer.cornerRadius = auxView.frame.size.height/2 + 2
        auxView.layer.borderWidth = 1.8
        auxView.layer.borderColor = UIColor.orange.cgColor
        
        storiesImage.image = UIImage(named: "profile-pic")
    }
}
