//
//  SockPair + Convenience.swift
//  MatchMySocksStoryBoard
//
//  Created by Ian Hall on 2/12/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import Foundation
import CoreData
import UIKit.UIImage

extension SockPair {
    convenience init (name: String, primaryColor: String, secondaryColor: String, note: String, lastWorn: Date = Date(), moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
        self.lastWorn = lastWorn
        self.note = note
        self.isFavorite = false
    }
    
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        } set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
}
