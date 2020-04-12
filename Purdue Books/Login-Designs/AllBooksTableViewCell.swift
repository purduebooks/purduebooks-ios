//
//  AllBooksTableViewCell.swift
//  Purdue Books
//
//  Created by Monal on 4/12/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit

class AllBooksTableViewCell: UITableViewCell {

    @IBOutlet weak var bookNamee: UILabel!
    @IBOutlet weak var couseNumbere: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
