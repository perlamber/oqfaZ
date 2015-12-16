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
        tblEventos.dataSource = self
        
        let newEvento = NSEntityDescription.insertNewObjectForEntityForName("Evento", inManagedObjectContext: self.contexto) as! Evento
        let newCategoria = NSEntityDescription.insertNewObjectForEntityForName("Categoria", inManagedObjectContext: self.contexto) as! Categoria
        let newUsuaruio = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: self.contexto) as! Usuario
        
        newUsuaruio.usu_nome = "User 1"
        newUsuaruio.usu_telefone = "Tel User 1"
        
        newCategoria.cat_nome = "categoria 2"
        
        newEvento.evn_nome = "Evento 1"
        newEvento.evn_endereco = "Rua 1"
        newEvento.evn_descricao = "Descricao 1"
        newEvento.usuario = newUsuaruio
        newEvento.categoria = newCategoria
        
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


}

