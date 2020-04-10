//
//  CameraController.swift
//  Project App
//
//  Created by Jefferson Santiago on 3/31/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation

class CameraControl {
    let session = AVCaptureSession()
    var camera: AVCaptureDevice?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    var cameraCaptureOutput: AVCapturePhotoOutput?
}


extension CameraControl {
    
}


struct CameraController: View {
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CameraController_Previews: PreviewProvider {
    static var previews: some View {
        CameraController()
    }
}
