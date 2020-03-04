//
//  RowViews.swift
//  Project App
//
//  Created by Jefferson Santiago on 2/13/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct RowViews: View {
    //var people: People
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("Garfield").resizable()
                    .frame(width: 80.0, height: 80.0)
                    .cornerRadius(50)
                
                VStack(alignment: .leading) {
                    Text("My Name Is")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    
                    Text("This is w/e")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }
                Spacer()
            }
            Divider()
            
            HStack(alignment: .top) {
                Image("Garfield")
                    .resizable()
                    .frame(width: 80.0, height: 80.0)
                    .cornerRadius(50)
                
                VStack(alignment: .leading) {
                    Text("My Name Is")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    
                    Text("This is w/e")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }
                Spacer()
            }
             Divider()
        }
        .padding()
    }
}

struct RowViews_Previews: PreviewProvider {
    static var previews: some View {
        RowViews()
    }
}
