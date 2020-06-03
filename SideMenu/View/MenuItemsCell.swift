//
//  MenuItemsCell.swift
//  SideMenu
//
//  Created by Steve JobsOne on 6/3/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class MenuItemsCell: UITableViewCell {

    @IBOutlet weak var menuDescriptionLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
