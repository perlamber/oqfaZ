//
//  EventoDescricaoViewController.swift
//  ScreensApp
//
//  Created by Student on 12/16/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit

class EventoDescricaoViewController: UIViewController {

    @IBOutlet weak var lblDataEvento: UILabel!
    @IBOutlet weak var lblNomeEvento: UILabel!
    @IBOutlet weak var lblNomeRua: UILabel!
    @IBOutlet weak var lblDescricao: UITextView!
    @IBOutlet weak var lblImagemEvento: UIImageView!
    @IBOutlet weak var lblCriadoPor: UILabel!
    @IBOutlet weak var lblTelContato: UILabel!
    var evento: Evento!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNomeEvento.text = evento.evn_nome
        print("log:\(evento?.evn_nome)")
        
        lblNomeRua.text = evento.evn_endereco
        print("log:\(evento?.evn_endereco)")
        
        lblDescricao.text = evento.evn_descricao
        print("log:\(evento?.evn_descricao)")
        
        lblCriadoPor.text = evento.usuario?.usu_nome
        print("log:\(evento.usuario?.usu_nome)")
        
        lblTelContato.text = evento.usuario?.usu_telefone
        print("log:\(evento.usuario?.usu_telefone)")
    
        lblDataEvento.text = evento.evn_data_evento
        
        lblImagemEvento.image = UIImage(data: evento.evn_imagem!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
