//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Malinga Bandara on 2021-12-31.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView! // you avatar image view
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set a radius to bubble message
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5  // why we assign height of message, cuz some one send a lengthy message then we can set the corner radius  nicely
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
