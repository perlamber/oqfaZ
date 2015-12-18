//
//  CadastroViewController.swift
//  ScreensApp
//
//  Created by Thiago Fortunato on 12/17/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class CadastroViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate {

    let contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    //outlets da view de Cadastro de Eventos
    @IBOutlet weak var categoriaPicker: UIPickerView!
    @IBOutlet weak var imgImageEvento: UIImageView!
    @IBOutlet weak var txtNomeEvento: UITextField!
    @IBOutlet weak var txtEndereco: UITextField!
    @IBOutlet weak var txtDescricao: UITextView!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var btnAddImagem: UIButton!
    @IBOutlet weak var btnSalvar: UIBarButtonItem!
    @IBOutlet weak var btnCancelar: UIBarButtonItem!
    @IBOutlet weak var txtDataEvento: UITextField!
    @IBOutlet weak var theMap: MKMapView!
    
    var evento : Evento! = nil
    var categoriaNome: String!
    let categorias = ["Show","Festa","Exposição","Confraternização","Inauguração","Teatro","Apresentação","Promoção","Esporte"]
    
    let imagePiker = UIImagePickerController()
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []

    //carrega o mapa com a localizacao do usuario
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePiker.delegate = self
        categoriaPicker.dataSource = self
        categoriaPicker.delegate = self
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        //Setup our Map View
        
        theMap.delegate = self
        theMap.mapType = MKMapType.Hybrid
        theMap.showsUserLocation = true
        
        // Do any additional setup after loading the view.
    }
    
    //metodos do MapKit
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        //theLabel.text = "\(locations[0])"
        
        myLocations.append(locations[0])

        let spanX = 0.007
        let spanY = 0.007
        
        let newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        
        theMap.setRegion(newRegion, animated: true)
        
        if (myLocations.count > 1){
            let sourceIndex = myLocations.count - 1
            let destinationIndex = myLocations.count - 2
            let c1 = myLocations[sourceIndex].coordinate
            let c2 = myLocations[destinationIndex].coordinate
            var a = [c1, c2]
            let polyline = MKPolyline(coordinates: &a, count: a.count)
            theMap.addOverlay(polyline)
        }
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //metodos para carregar imagens a galeria de fotos
    @IBAction func btnCarregarImagem(sender: AnyObject) {
        imagePiker.allowsEditing = false
        imagePiker.sourceType = .PhotoLibrary
        
        presentViewController(imagePiker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imgImageEvento.contentMode = .ScaleAspectFit
            imgImageEvento.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    //Metodos que trabalham com o PickerView - Categorias
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorias.count
    }
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorias[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoriaNome = categorias[row]
        print("log:\(categoriaNome)")
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
    
    
    // MARK:- Create eveto
    //Cria evento, insercao direto no banco de dados
    func criaEvento() {
        let entityEvento = NSEntityDescription.entityForName("Evento", inManagedObjectContext: contexto)
        let entityCategoria = NSEntityDescription.entityForName("Categoria", inManagedObjectContext: contexto)
        let entityUsuario = NSEntityDescription.entityForName("Usuario", inManagedObjectContext: contexto)
        
        let evento = Evento(entity: entityEvento!, insertIntoManagedObjectContext: contexto)
        let categoria = Categoria(entity: entityCategoria!, insertIntoManagedObjectContext: contexto)
        let usuario = Usuario(entity: entityUsuario!, insertIntoManagedObjectContext: contexto)
        
        let formato = NSDateFormatter()

        evento.evn_nome = txtNomeEvento.text
        evento.evn_endereco = txtEndereco.text
        evento.evn_data_evento = txtDataEvento.text!
        print("data: ", evento.evn_data_evento)
        evento.evn_descricao = txtDescricao.text
        
        let data = NSDate()
        formato.dateStyle = NSDateFormatterStyle.ShortStyle
        evento.evn_data_cadastro = formato.stringFromDate(data)
        categoria.cat_nome = categoriaNome
        usuario.usu_nome = "Nome Usuario"
        usuario.usu_telefone = txtTelefone.text
        evento.evn_imagem = UIImagePNGRepresentation(imgImageEvento.image!)
        
        
        evento.usuario = usuario
        evento.categoria = categoria
        
        do{
            try contexto.save()
        }catch let error as NSError {
            print("Erro ao criar evento")
            print(error)
        }
    }
    
    //pin no mapa
    func inserirPin(cx: Double, cy: Double, name: String){
        let anot: MKPointAnnotation = MKPointAnnotation()
        anot.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(cx),CLLocationDegrees(cy))
        anot.title = name
        self.theMap.addAnnotation(anot)
        
    }
    
    
    var selectedAnnotation: MKPointAnnotation!
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView {
            selectedAnnotation = view.annotation as? MKPointAnnotation
            performSegueWithIdentifier("proximo", sender: self)
        }
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationIdentifier = "pin"
        var view = mapView.dequeueReusableAnnotationViewWithIdentifier(annotationIdentifier)
        if view == nil {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        } else {
            view?.annotation = annotation
        }
        return view
    }
    
    
}
