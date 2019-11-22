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
    
    //MARK: - CREATE
    
    //create a sock
    
    
    
    //MARK: - UPDATE
    
    //addphoto to sock
    
    //toggle favorite
    
    
    //toggle lost/unlost
    
    //change note
    
    //change vibe
    func changeVibe(sock: Sock, vibe: String) {
        sock.vibe = vibe
        saveToPersistenceStore()
    }
    
    //change website
    func changeSocksWebsite(sock: Sock, website: String) {
        sock.websiteLink = website
        saveToPersistenceStore()
    }
    
    
    //change colors
    func changeSocksPrimary(sock: Sock, primary color: String) {
        sock.primaryColor = color
        saveToPersistenceStore()
    }
    
    func changeSocksSecondary(sock: Sock, secondary color: String) {
        sock.secondaryColor = color
        saveToPersistenceStore()
    }
    
    
    
    //MARK: - DELETE
    
    func deleteSock(_ sock: Sock) {
        if let moc = sock.managedObjectContext {
            moc.delete(sock)
            saveToPersistenceStore()
        }
    }
    
    //MARK: - PERSISTENCE
    
    func saveToPersistenceStore() {
        if CoreDataStack.context.hasChanges {
            try? CoreDataStack.context.save()
        }
    }
}
