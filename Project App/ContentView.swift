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

        ScrollView {
            VStack {
                ImageSelectionUI(imageNum: 0)
                ImageSelectionUI(imageNum: 1)
                ImageSelectionUI(imageNum: 2)
                ImageSelectionUI(imageNum: 3)
                ImageSelectionUI(imageNum: 4)
                ImageSelectionUI(imageNum: 5)
                ImageSelectionUI(imageNum: 6)
                ImageSelectionUI(imageNum: 7)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
