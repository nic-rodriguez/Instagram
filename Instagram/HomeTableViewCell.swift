//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by Nicolas Rodriguez on 6/27/17.
//  Copyright © 2017 Nicolas Rodriguez. All rights reserved.
//

import UIKit
import Parse
import ParseUI

@objc protocol HomeTableViewCellDelegate {
    func didSelectPhoto(homeTableViewCell: HomeTableViewCell)
    func didSelectUser(homeTableViewCell: HomeTableViewCell)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userCaptionLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    var delegate: HomeTableViewCellDelegate?
    
    var post: PFObject! {
        didSet {
            self.postImageView.file = post["media"] as? PFFile
            self.postImageView.loadInBackground()
            let author = post["author"] as! PFUser
            self.userLabel.text = author.username
            self.captionLabel.text = post["caption"] as? String
            self.userCaptionLabel.text = author.username
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func photoTap(_ sender: Any) {
        delegate!.didSelectPhoto(homeTableViewCell: self)
    }
    
}
