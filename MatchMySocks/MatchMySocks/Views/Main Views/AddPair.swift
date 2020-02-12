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
    @State var image: Image? = Image("empty")
    @State private var textField = ""
    @State var showCaptureImageView: Bool = false
    var body: some View {
        VStack {
            TextField("Name This Pair of Socks", text: $textField)
            Divider()
            
            Button(action: {
                self.showCaptureImageView.toggle()
            }) {
                image?
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 0.5)
                    .frame(width: 350, height: 350, alignment: .center)
            }
            
            if (showCaptureImageView) {
                CaptureImageView(isShown: $showCaptureImageView, image: $image)
            }
            
        }.padding()
        
        
    }
    
}

struct CaptureImageView {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
    
}

extension CaptureImageView: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CaptureImageView>) {
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
}
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: Image?
    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageInCoordinator = Image(uiImage: unwrapImage)
        isCoordinatorShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
}

struct AddPair_Previews: PreviewProvider {
    static var previews: some View {
        AddPair()
    }
}
