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
            Form {
                Section {
                    Text("My Socks")
                    .hidden()
                }
            }
            .navigationBarTitle("My Socks")
            .navigationBarItems(trailing: Button("Camera", action: {
                print("Go to Camera")
            }))
            List {
                ForEach(0..<socksChunked.count, id: \.self) { index in
                    HStack {
                        ForEach(self.socksChunked[index], id: \.self) { sock in
                            GridCell(sock: sock)
                        }
                    }
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
