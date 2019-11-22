//
//  SockController.swift
//  SockDrawr
//
//  Created by Ian Hall on 11/22/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation
import CoreData

class SockController {
    static let shared = SockController()
    
    var sockDrawer = [Sock]()
    
    init() {
        let fetchRequest: NSFetchRequest<Sock> = Sock.fetchRequest()
        let moc = CoreDataStack.context
        sockDrawer = (try? moc.fetch(fetchRequest)) ?? []
        
    }
}
