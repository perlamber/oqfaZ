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
    var contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblEventos.dataSource = self
        
        do{
            try contexto.save()
        }catch _ {
            print("erro")
        }
        
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
        //print("linhas:", numberOfRowsInSection)
        return numberOfRowsInSection!
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        let evento = fetchedResultController.objectAtIndexPath(indexPath) as! Evento
        
        cell.lblNomeEvento.text = evento.evn_nome
        cell.lblNomeCategoria.text = evento.categoria?.cat_nome
        cell.imgImagemEvento.image = UIImage(data: evento.evn_imagem!)
        
        print("log:", evento.evn_descricao)
        cell.evento = evento
        
        print("log:\(evento.categoria?.cat_nome)")
    
        return cell
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mostraDescricaoEvento"{
            if let objEvento = segue.destinationViewController as? EventoDescricaoViewController{
                if let cell = sender as? TableViewCell{
                    objEvento.evento = cell.evento
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tblEventos.reloadData()
    }

}

