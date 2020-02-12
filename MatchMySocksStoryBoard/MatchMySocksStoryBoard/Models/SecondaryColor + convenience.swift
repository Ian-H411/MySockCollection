//
//  SecondaryColor + convenience.swift
//  MatchMySocksStoryBoard
//
//  Created by Ian Hall on 2/12/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import Foundation
import CoreData
import UIKit.UIColor

extension SecondaryColor {
    
    convenience init(color: UIColor, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.hue = color.str
        
    }
    
    var UIColor: UIColor {
        return UIColor(hue: <#T##CGFloat#>, saturation: <#T##CGFloat#>, brightness: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }
}
