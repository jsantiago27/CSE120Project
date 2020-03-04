//
//  Stuff.swift
//  Project App
//
//  Created by Jefferson Santiago on 2/13/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct Stuff: View {
    var body: some View {
        VStack {
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
            
            
            
            Text("Placeholder")
                .bold()
                .foregroundColor(Color.red)
            
            Text("Placeholder")
            Text("Placeholder")
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
        }
        
        
    }
}

struct Stuff_Previews: PreviewProvider {
    static var previews: some View {
        Stuff()
    }
}
