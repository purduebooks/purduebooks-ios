//
//  BooksTableViewCell.swift
//  Purdue Books
//
//  Created by Vidur Gupta on 4/5/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet weak var couseNumber: UILabel!
    @IBOutlet weak var bookName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
