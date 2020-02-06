//
//  ImageLibraryPicker.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/6/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import SwiftUI

struct LibraryImage: View {

    @State var showAction: Bool = false
    @State var showImagePicker: Bool = false

    @State var uiImage: UIImage? = nil

    var sheet: ActionSheet {
        ActionSheet(
            title: Text("Action"),
            message: Text("Quotemark"),
            buttons: [
                .default(Text("Change"), action: {
                    self.showAction = false
                    self.showImagePicker = true
                }),
                .cancel(Text("Close"), action: {
                    self.showAction = false
                }),
                .destructive(Text("Remove"), action: {
                    self.showAction = false
                    self.uiImage = nil
                })
            ])

    }


    var body: some View {
        VStack {

            if (uiImage == nil) {
                Image(systemName: "camera.on.rectangle")
                    .accentColor(Color.App.purple)
                    .background(
                        Color.App.gray
                            .frame(width: 100, height: 100)
                            .cornerRadius(6))
                    .onTapGesture {
                        self.showImagePicker = true
                    }
            } else {
                Image(uiImage: uiImage!)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(6)
                    .onTapGesture {
                        self.showAction = true
                    }
            }

        }

        .sheet(isPresented: $showImagePicker, onDismiss: {
            self.showImagePicker = false
        }, content: {
            ImagePicker(isShown: self.$showImagePicker, uiImage: self.$uiImage)
        })

        .actionSheet(isPresented: $showAction) {
            sheet
        }
    }
}
