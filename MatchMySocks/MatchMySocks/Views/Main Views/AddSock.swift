//
//  AddSock.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/6/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import SwiftUI

struct AddSock:UIViewRepresentable, View {
    typealias UIViewType = 
    
    func makeCameraView() -> CameraControlViewController {
        return CameraControlViewController()
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddSock_Previews: PreviewProvider {
    static var previews: some View {
        AddSock()
    }
}
