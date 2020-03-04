//
//  ImagePicke.swift
//  Project App
//
//  Created by Jefferson Santiago on 2/15/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    var sourceType: Int
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = sourceType == 1 ? .photoLibrary : .camera
        
        picker.delegate = context.coordinator
        return picker
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var isShown: Bool
        @Binding var image: Image?
        
        init(isShown: Binding<Bool>, image: Binding<Image?>) {
            _isShown = isShown
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
            isShown = false
            
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown = false
        }
    }

    
    
}
