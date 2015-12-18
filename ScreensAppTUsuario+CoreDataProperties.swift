//
//  Usuario+CoreDataProperties.swift
//  ScreensApp
//
//  Created by Student on 12/15/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Usuario {

    @NSManaged var usu_nome: String?
    @NSManaged var usu_senha: String?
    @NSManaged var usu_email: String?
    @NSManaged var usu_sexo: NSNumber?
    @NSManaged var usu_telefone: String?
    @NSManaged var usu_whatsapp: NSNumber?
    @NSManaged var usu_viber: NSNumber?
    @NSManaged var usu_line: NSNumber?

}
