//
//  GridCell.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/5/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import SwiftUI
import UIKit.UIImage

struct GridCell: View {
    
    let sock: Sock
    
    var body: some View {
        HStack{
            if sock.photo != nil {
                Image(uiImage: sock.photo!)
            }
            Text(sock.name!)
        }
    }
}

struct GridCell_Previews: PreviewProvider {
    static var previews: some View {
        GridCell(sock: Sock(name: "In The Bahamas", isFavorite: true, PrimaryColor: "Blue", secondaryColor: "Orange"))
    }
}
