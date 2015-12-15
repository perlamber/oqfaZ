//
//  ViewController.swift
//  ScreensApp
//
//  Created by Student on 12/10/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    //outlet da tabela de eventos
    @IBOutlet weak var tblEventos: UITableView!
    var eventos = Array<Evento>()

    var contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newEvento = NSEntityDescription.insertNewObjectForEntityForName("Evento", inManagedObjectContext: self.contexto) as! Evento
        
        newEvento.evn_nome = "Evento 1"
        newEvento.evn_endereco = "RUA 01"
        newEvento.evn_imagem = nil 

        carregarEventos()
    }
    
    
    func carregarEventos(){
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        
        do{
            try fetchedResultController.performFetch()
        } catch let error as NSError {
            print("Erro ao buscar tarefas: \(error), \(error.userInfo) ")
        }
    }
    
    
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController( fetchRequest: eventoFetchRequest(), managedObjectContext: contexto, sectionNameKeyPath: nil , cacheName: nil )
        return fetchedResultController
    }

    
    func eventoFetchRequest() -> NSFetchRequest {
        let fetchResquest  = NSFetchRequest(entityName: "Evento")
        let sortDescriptor = NSSortDescriptor(key: "evn_nome", ascending: true)
        fetchResquest.sortDescriptors = [sortDescriptor]
        
        return fetchResquest
    }
    
    
    // TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSection = fetchedResultController.sections?.count
        return numberOfSection!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = fetchedResultController.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        let evento = fetchedResultController.objectAtIndexPath(indexPath) as! Evento
        
        //cell.evento = evento
        
        cell.lblNomeEvento.text = evento.evn_nome
        cell.lblNomeRua.text = evento.evn_endereco
        
        return cell
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

