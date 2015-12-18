//
//  TableViewCell.swift
//  ScreensApp
//
//  Created by Student on 12/15/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //componentes da celula dentro da tableView
    @IBOutlet weak var lblNomeEvento: UILabel!
    @IBOutlet weak var lblNomeCategoria: UILabel!
    @IBOutlet weak var imgImagemEvento: UIImageView!
    var evento : Evento!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
