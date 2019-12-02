//
//  Sock+Convenience.swift
//  SocDrawr1.1
//
//  Created by Ian Hall on 12/1/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
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
