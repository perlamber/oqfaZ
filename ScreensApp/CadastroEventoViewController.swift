//  ViewController.swift
//  ScreensApp
//
//  Created by Student on 12/10/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit
import CoreData

class CadastroEventoViewController: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate {
	    
    let contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    @IBOutlet weak var imgVImage: UIImageView!
    @IBOutlet weak var btnAddImage: UIButton!
    @IBOutlet weak var txtFieldNomeEvento: UITextField!
    @IBOutlet weak var txtFieldEndereco: UITextField!
    @IBOutlet weak var txtViewDescricao: UITextView!
    @IBOutlet weak var txtFieldContato: UITextField!
    @IBOutlet weak var btnSalvar: UIButton!
    
    let imagePiker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePiker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadImageButton(sender: AnyObject) {
        imagePiker.allowsEditing = false
        imagePiker.sourceType = .PhotoLibrary
        
        presentViewController(imagePiker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imgVImage.contentMode = .ScaleAspectFit
            imgVImage.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func salvar(sender: AnyObject) {
        if evento == nil {
            criaEvento()
        }
        dismissViewController()
    }

    @IBAction func cancelar(sender: AnyObject) {
         dismissViewController()
    }
    
    // MARK:- Dismiss ViewControllers
    func dismissViewController() {
        navigationController?.popViewControllerAnimated(true)
    }

    // MARK:- Create task
    // MECHER NESSA CLASSE AQUI !!!!!! ---------------------------
    func criaEvento() {
        let entityEvento = NSEntityDescription.entityForName("Evento", inManagedObjectContext: contexto!)
        let entityCategoria = NSEntityDescription.entityForName("Categoria", inManagedObjectContext: contexto!)
        let entityUsuario = NSEntityDescription.entityForName("Usuario", inManagedObjectContext: contexto!)

        let evento = Evento(entity: entityDescription!, insertIntoManagedObjectContext: contexto)

        evento.evn_nome = lblNomeEvendo.text
        evento.evn_endereco = lblEndereco.text
        evento.evn_imagem = imgImagemEvento.image

        
        do{
            try contexto?.save()
        }catch let error as NSError {
            print("Erro ao criar tarefa")
            print(error)
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "salvaEvento"{
            if let objEvento = segue.destinationViewController as? ViewController{
                if let cell = sender as? CadastroEventoViewController{
                    objEvento.evento = cell.evento
                }
            }
        }
    }
}