//
//  Cidade+CoreDataProperties.swift
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

extension Cidade {

    @NSManaged var codigo: NSNumber?
    @NSManaged var nome: String?
    @NSManaged var ddd: NSNumber?

}
