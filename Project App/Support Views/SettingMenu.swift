//
//  SettingMenu.swift
//  Project App
//
//  Created by team T͟Hē Lōkātərs on 4/14/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
//

import SwiftUI

struct SettingMenu: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9720847011, green: 0.7606303096, blue: 0.5701220632, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("About")
            }
        }
        .navigationBarTitle(Text("Settings"), displayMode: .inline)
    }
}

struct SettingMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingMenu()
    }
}
