//
//  ImageSelectionUI.swift
//  Project App
//
//  Created by Jefferson Santiago on 3/4/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct ImageSelectionUI: View {
    // State variables are variables that saves it "state" or value when there is an update
    // from your scene. Whenever a state is change, the application will recompute the body
    // to adapt the changes of the state.
    // If you analyze the code, you will see that the State Variables and Binded variables in the
    // other files have the same name, the reason is the binded variables are "binded" to the state
    // variables such that whenever you there is a changed to the binded variable, it will also
    // affect the state variable.
    @State var showImagePicker: Bool = false
    @State var image: Image? = Image("Garfield")
    @State var showActionSheet:Bool = false
    @State var sourceType: Int = 0
    var imageNum: Int = 0;

    
    var body: some View {
        //ZStack {
            // A VStack stacks windows vertically
            VStack {
                HStack {
                    image?
                        .resizable()
                        .clipped()
                        .cornerRadius(20)
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fill)
                        .shadow(radius: 10)
                    
                    Spacer()
                
                    Camera(showActionSheet: $showActionSheet)

                }
                .padding(8)
                .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
                        ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the gallery or use the camera"), buttons: [ActionSheet.Button.default(Text("Camera"),action: {
                            self.sourceType = 0
                            self.showImagePicker.toggle()
                        }),
                        ActionSheet.Button.default(Text("Photo Gallery"), action: {
                            self.sourceType = 1
                            self.showImagePicker.toggle()
                            
                        }),
                        // Cancle Button
                        ActionSheet.Button.cancel()
                    ])
                })
                .sheet(isPresented: self.$showImagePicker) {
                        ImagePicker(isShown: self.$showImagePicker, image: self.$image, sourceType: self.sourceType)
                }
            }
        //}
    }
}

struct ImageSelectionUI_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionUI()
    }
}
