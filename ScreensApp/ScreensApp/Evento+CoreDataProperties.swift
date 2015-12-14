//
//  Evento+CoreDataProperties.swift
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

extension Evento {

    @NSManaged var categoria: String?
    @NSManaged var cidade: String?
    @NSManaged var coding: NSNumber?
    @NSManaged var data_cadastro: NSDate?
    @NSManaged var data_evento: NSDate?
    @NSManaged var data_ultima_alteracao: NSDate?
    @NSManaged var descricao: String?
    @NSManaged var endereco: String?
    @NSManaged var imagem: NSObject?
    @NSManaged var local_cor_lat: NSNumber?
    @NSManaged var nome_evento: String?
    @NSManaged var numero: NSNumber?
    @NSManaged var usuario_codigo: NSNumber?
    @NSManaged var usuario_nome: String?
    @NSManaged var local_cor_long: NSNumber?

}
