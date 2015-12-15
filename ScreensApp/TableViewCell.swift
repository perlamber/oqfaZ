//
//  TableViewCell.swift
//  ScreensApp
//
//  Created by Student on 12/15/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblNomeEvento: UILabel!
    @IBOutlet weak var lblNomeRua: UILabel!
    @IBOutlet weak var imgImageEvento: UIImageView!
    var evento : Evento!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblNomeEvento.text = evento.evn_nome
        lblNomeRua.text = evento.evn_endereco
        imgImageEvento.image = evento.evn_imagem as! UIImage
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
