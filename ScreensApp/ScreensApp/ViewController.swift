//
//  ViewController.swift
//  ScreensApp
//
//  Created by Student on 12/10/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tblListaEventos: UITableView!
    @IBOutlet weak var lblDataHoje: UILabel!
    var eventos : Array<Evento>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return eventos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        
        cell.lblNomeEvento.text = eventos[indexPath.row].nome_evento
        cell.lblCategoria.text = eventos[indexPath.row].categoria
        cell.
        return cell
    }
    



}

