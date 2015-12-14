//
//  Usuario+CoreDataProperties.swift
//  ScreensApp
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Usuario {

    @NSManaged var codigo: NSNumber?
    @NSManaged var nome: String?
    @NSManaged var senha: String?
    @NSManaged var email: String?
    @NSManaged var sexo: String?
    @NSManaged var telefone: NSNumber?
    @NSManaged var whatsapp: NSNumber?
    @NSManaged var viber: NSNumber?

}
