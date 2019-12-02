//
//  CoreDataStack.swift
//  SocDrawr1.1
//
//  Created by Ian Hall on 12/1/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SockDrawr")
        container.loadPersistentStores(){ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error\(error), \(error.userInfo)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext {return container.viewContext}
}
