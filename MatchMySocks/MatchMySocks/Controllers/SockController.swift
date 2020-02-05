//
//  SockController.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/5/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import Foundation
import CoreData
import UIKit.UIImage

class SockController {
    
    static let shared: SockController = SockController()
    
    var chunkedSocks: [[Sock]] = [[]]
    var sockDrawer: [Sock] = []
    
    init() {
        let fetchRequest: NSFetchRequest<Sock> = Sock.fetchRequest()
        let moc = CoreDataStack.context
        sockDrawer = (try? moc.fetch(fetchRequest)) ?? []
        chunkedSocks = sockDrawer.chunked(by: 2)
    }
    
    //MARK: - CREATE
    @discardableResult func create(sockName: String, isFavorite: Bool, primaryColor: String?, secondaryColor: String?, image: UIImage?) -> Sock {
        
        let newSock = Sock(name: sockName , isFavorite: isFavorite, PrimaryColor: primaryColor ?? "", secondaryColor: secondaryColor ?? "")
        if let sockPic = image {
            changeSocksPhoto(sock: newSock, image: sockPic)
        }
        sockDrawer.append(newSock)
        saveToPersistenceStore()
        return newSock
    }
    
    
    
    //MARK: - UPDATE
    
    //addphoto to sock
    func changeSocksPhoto(sock: Sock, image: UIImage) {
        sock.photo = image
        saveToPersistenceStore()
    }
    
    //toggle favorite
    func toggleFavorite(sock: Sock) {
        sock.isFavorite.toggle()
        saveToPersistenceStore()
    }
    
    
    //toggle lost/unlost
    func toggleLostLeftSock(sock: Sock) {
        sock.isLeftMissing.toggle()
        saveToPersistenceStore()
    }
    
    func toggleLostRightSock(sock: Sock) {
        sock.isRightMissing.toggle()
        saveToPersistenceStore()
    }
    
    //change note
    func changeNote(sock: Sock, note: String) {
        sock.note = note
        saveToPersistenceStore()
    }
    
    //change vibe
    func changeVibe(sock: Sock, vibe: String) {
        sock.vibe = vibe
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
