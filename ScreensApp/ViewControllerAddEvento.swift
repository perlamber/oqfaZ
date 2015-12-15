//
//  ViewControllerAddEvento.swift
//  ScreensApp
//
//  Created by Student on 12/15/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//

import UIKit

class ViewControllerAddEvento: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
