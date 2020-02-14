//
//  ClientProfileHeaderCell.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 15.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

class ClientProfileHeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editButton(_ sender: UIButton) {
    }
    
}
