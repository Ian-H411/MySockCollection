//
//  ContentView.swift
//  SockDrawr
//
//  Created by Ian Hall on 11/22/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            Text("Sock Drawer").tabItem { Text("Sock Drawer") }.tag(1)
            Text("Tab Content 2").tabItem { Text("Schedule") }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
