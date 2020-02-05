//
//  Sock+convenience.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/5/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import Foundation
import CoreData
import UIKit.UIImage

extension Sock {
    convenience init(name: String, isFavorite: Bool, PrimaryColor: String, secondaryColor: String, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
        self.isFavorite = isFavorite
        self.primaryColor = PrimaryColor
        self.secondaryColor = secondaryColor
        self.vibe = ""
        self.note = ""
        self.isLeftMissing = false
        self.isRightMissing = false
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
