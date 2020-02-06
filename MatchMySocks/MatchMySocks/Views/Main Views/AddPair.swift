//
//  AddPair.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/6/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import SwiftUI
import UIKit.UIImage

struct AddPair: View {
    let defaultImage = "empty"
    @State private var textField = ""
    var body: some View {
        VStack {
            TextField("Name This Pair of Socks", text: $textField)
            Divider()
            ZStack{
                Button(action: {
                    self.addPhotoButtonTapped()
                }) {
                    Text("")
                }
                Image(defaultImage).resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 0.5)
                    
                    .frame(width: 350, height: 350, alignment: .center)
            }
            
        }.padding()
    }
    
    func addPhotoButtonTapped() {
        
    }
}

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCordinator {
        return ImagePickerCordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
}
class ImagePickerCordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    init(isShown : Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image   = image
    }
    
    //Selected Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
    }
    
    //Image selection got cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker    : Bool
    @Binding var image              : Image?
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

struct AddPair_Previews: PreviewProvider {
    static var previews: some View {
        AddPair()
    }
}
