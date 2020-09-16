//
//  CustomViewCell.swift
//  JsonPlaceHolderApp
//
//  Created by Andres Rivas on 16/09/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        customView.clipsToBounds = true
        customView.layer.cornerRadius = customView.frame.width / 2
    }

    func setupCell(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle

    }
    
}
