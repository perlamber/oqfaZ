//
//  TableViewCell.swift
//  ScreensApp
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblNomeEvento: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var imgImagemEvento: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
