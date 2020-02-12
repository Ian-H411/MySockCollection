//
//  SockPairController.swift
//  MatchMySocksStoryBoard
//
//  Created by Ian Hall on 2/12/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import Foundation
import CoreData
import UIKit.UIImage

class SockController {
    
    static let shared: SockController = SockController()
    
    var chunkedSocks: [[SockPair]] = [[]]
    var sockDrawer: [SockPair] = []
    
    init() {
        let fetchRequest: NSFetchRequest<SockPair> = SockPair.fetchRequest()
        let moc = CoreDataStack.context
        sockDrawer = (try? moc.fetch(fetchRequest)) ?? []
        chunkedSocks = sockDrawer.chunked(by: 2)
    }
    
    //MARK: - CREATE
    @discardableResult func create(sockName: String, note: String, primaryColor: String, secondaryColor: String, image: UIImage?) -> SockPair {
        
        let newSock = SockPair(name: sockName, note: note)
        if let sockPic = image {
            changeSocksPhoto(sock: newSock, image: sockPic)
        }
        sockDrawer.append(newSock)
        saveToPersistenceStore()
        return newSock
    }
    
    //MARK: - UPDATE
    
    //addphoto to sock
    func changeSocksPhoto(sock: SockPair, image: UIImage) {
        sock.photo = image
        saveToPersistenceStore()
    }
    
    //toggle favorite
    func toggleFavorite(sock: SockPair) {
        sock.isFavorite.toggle()
        saveToPersistenceStore()
    }
    
    //change note
    func changeNote(sock: SockPair, note: String) {
        sock.note = note
        saveToPersistenceStore()
    }
    
    //MARK: - DELETE
    
    func deleteSock(_ sock: SockPair) {
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
