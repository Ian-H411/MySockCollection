//
//  AddNewPairView.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/6/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import SwiftUI

struct AddNewPairView: View {
    @State private var sockNamePlaceHolder: String = ""
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Add a new Pair!")
            Spacer()
            Divider()
            TextField("Name", text: $sockNamePlaceHolder)
            Spacer()
            Divider()
            ZStack {
                Button(action: {}) {
                    Text("")
                }
                
            }
            
        }

    }
}

struct AddNewPairView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPairView()
    }
}
