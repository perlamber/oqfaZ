//
//  Evento+CoreDataProperties.swift
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

extension Evento {

    @NSManaged var evn_nome: String?
    @NSManaged var evn_local_latitude: NSNumber?
    @NSManaged var evn_data_cadastro: NSDate?
    @NSManaged var evn_data_evento: NSDate?
    @NSManaged var env_data_ultima_alteracao: NSDate?
    @NSManaged var evn_descricao: String?
    @NSManaged var evn_imagem: NSObject?
    @NSManaged var evn_endereco: String?
    @NSManaged var evn_local_longitude: NSNumber?
    @NSManaged var evn_numero: NSNumber?
    @NSManaged var evn_cidade: String?
    @NSManaged var usuario: Usuario?
    @NSManaged var categoria: Categoria?

}
