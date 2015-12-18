//
//  Evento+CoreDataProperties.swift
//  ScreensApp
//
//  Created by Student on 12/17/15.
//  Copyright © 2015 Thiago Fortunato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Evento {

    @NSManaged var env_data_ultima_alteracao: NSDate?
    @NSManaged var evn_cidade: String?
    @NSManaged var evn_data_cadastro: String?
    @NSManaged var evn_data_evento: String?
    @NSManaged var evn_descricao: String?
    @NSManaged var evn_endereco: String?
    @NSManaged var evn_imagem: NSData?
    @NSManaged var evn_local_latitude: NSNumber?
    @NSManaged var evn_local_longitude: NSNumber?
    @NSManaged var evn_nome: String?
    @NSManaged var evn_numero: NSNumber?
    @NSManaged var categoria: Categoria?
    @NSManaged var usuario: Usuario?

}
