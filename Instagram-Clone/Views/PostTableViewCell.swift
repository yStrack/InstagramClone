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
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(post: Post){
        self.userName.text = post.user.name
        self.userImage.image = post.user.profilePic
        self.postLocation.text = post.location ?? ""
        self.postImage.image = post.image
        self.likesLabel.text = post.likes
        self.descriptionLabel.text = post.description
    }

}
