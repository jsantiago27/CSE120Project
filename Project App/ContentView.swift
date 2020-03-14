//
//  ContentView.swift
//  Project App
//
//  Created by Jefferson Santiago on 2/12/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Update these 3 pictures")
                .font(.title)
            
            ScrollView {
                VStack {
                    ImageSelectionUI(imageNum: 0)
                    ImageSelectionUI(imageNum: 1)
                    ImageSelectionUI(imageNum: 2)
                    ImageSelectionUI(imageNum: 3)
                    ImageSelectionUI(imageNum: 4)
                }
            }
            .padding()
            
            VStack() {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("BUTTON")
                        .foregroundColor(Color.white)
                }
                .frame(width: 150, height: 50)
                .background(Color.green)
            }
            .scaledToFit()
            .cornerRadius(10)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
