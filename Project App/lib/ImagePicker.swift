//
//  ImagePicke.swift
//  Project App
//  Description: This file handles the image pick and as well the camera shot of the app.
//
//  Created by Jefferson Santiago on 2/15/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
    // Binding variables that will be used in the main view of the app.
    // Tells the app that the user is currently choosing a photo or in the middle of using the camera
    @Binding var isShown: Bool
    // This will hold the image that is chosen/captured by the user.
    @Binding var image: Image?
    @Binding var focalLength: Double?
    @Binding var location: CLLocation?
    @Binding var zoomFactor: Double?
    
    var sourceType: Int
    //
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // Left empty on purpose, for now
        
    }
    
    // Return the variables that we Instantiated from the class Coordinator
    // This method handles the inputs of the user
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, focalLength: $focalLength, location: $location, zoomFactor: $zoomFactor)
    }
    
    // This will handle the user image picks
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        // Allow the user to edit the photo
        picker.allowsEditing = true
        // Determins if the user wants to choose photo from the library or use the camera
        picker.sourceType = sourceType == 1 ? .photoLibrary : .camera
        // Set the coordinator to the its delegate
        picker.delegate = context.coordinator
        // Return the controller which shows the menu/camera based on user's input
        
        return picker
    }
}

// The coordinator class that will handle the inputs of our user.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @ObservedObject var locationManager = LocationManager()
    
    // Binding variables that are the same as above.
    @Binding var isShown: Bool
    @Binding var image: Image? // Check if its nil (null) or not.
    @Binding var focalLength: Double?
    @Binding var location: CLLocation?
    @Binding var zoomFactor: Double?
    // Instantiate based on specific parameters
    init(isShown: Binding<Bool>, image: Binding<Image?>,  focalLength: Binding<Double?>, location: Binding<CLLocation?>, zoomFactor: Binding<Double?>) {
        _isShown = isShown
        _image = image
        _focalLength = focalLength
        _location = location
        _zoomFactor = zoomFactor
    }
    
    // Handles the user's input when he looking in the photo library or captured the image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let metadata = info[UIImagePickerController.InfoKey.mediaMetadata] as? NSDictionary
        let exifdata = metadata!["{Exif}"] as! NSDictionary
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
        focalLength = (exifdata["FocalLength"] as! Double)
        zoomFactor = (exifdata["DigitalZoomRatio"] as! Double)
        location = locationManager.loc
    }
    
    // When the user cancels the selection/camera capture
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}
