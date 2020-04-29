//
//  PostTableViewCell.swift
//  Instagram-Clone
//
//  Created by Yuri Strack on 27/04/20.
//  Copyright © 2020 Yuri Strack. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postLocation: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(){
        self.selectionStyle = .none
        
        moreButton.setImage(UIImage(named: "menu") , for: .normal)
        
        postImage.contentMode = .scaleAspectFill
        postImage.clipsToBounds = true
        userImage.layer.borderWidth = 2;
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.cornerRadius = 30
        userImage.layer.masksToBounds = true
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = userImage.frame.size.height/2
    }
    
    func set(post: Post){
        self.userName.text = post.user.name
        self.userImage.image = post.user.profilePic
        self.postLocation.text = post.location ?? ""
        self.postImage.image = post.image
        self.likesLabel.text = post.likes
        
        let range = NSMakeRange(post.user.name.count, post.description.count+1)
        self.descriptionLabel.attributedText = attributedString(from: post.user.name + " " + post.description, nonBoldRange: range)
    }

}

extension PostTableViewCell{
    func attributedString(from string: String, nonBoldRange: NSRange?) -> NSAttributedString {
        let fontSize = UIFont.systemFontSize
        let attrs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        let nonBoldAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize),
        ]
        let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
        if let range = nonBoldRange {
            attrStr.setAttributes(nonBoldAttribute, range: range)
        }
        return attrStr
    }
}
