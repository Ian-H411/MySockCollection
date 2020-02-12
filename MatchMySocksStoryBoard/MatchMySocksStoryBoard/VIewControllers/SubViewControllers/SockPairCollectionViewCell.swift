//
//  SockPairCollectionViewCell.swift
//  MatchMySocksStoryBoard
//
//  Created by Ian Hall on 2/12/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import UIKit

class SockPairCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sockPairImage: UIImageView!
    
    @IBOutlet weak var sockNameLabel: UILabel!
    
    func updateCell(sock: SockPair) {
        guard let name = sock.name else {return}
        if let image = sock.photo {
            sockPairImage.image = image
        }
        sockNameLabel.text = name
    }
    
}
