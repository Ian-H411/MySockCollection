//
//  SockCollectionView.swift
//  SockDrawr
//
//  Created by Ian Hall on 11/25/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import SwiftUI
import UIKit

struct SockCollectionView: View {
    var body: some View {
        List() {
            ForEach(0..<8) { _ in
                HStack {
                    ForEach(0..<3) { _ in
                        Image("orange_color")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

struct SockCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SockCollectionView()
    }
}
