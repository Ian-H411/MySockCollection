//
//  ContentView.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/5/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let socksChunked = SockController.shared.chunkedSocks
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<socksChunked.count, id: \.self) { index in
                    HStack {
                        ForEach(self.socksChunked[index], id: \.self) { sock in
                            GridCell(sock: sock)
                        }
                    }
                }
                
            }.navigationBarItems(trailing: NavigationLink(destination: AddPair(), label: {
                Text("add")
            }))
                
        .navigationBarTitle("My Socks")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
