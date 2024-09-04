//
//  ContentView.swift
//  Landmarks
//
//  Created by Sundet Mukhtar on 04.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y:-130)
                .padding(.bottom,-130)
            
            VStack(alignment:.leading) {
                
                Text("Turtle Rock")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.black)
                
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")

                    .font(.title2)

                Text("Descriptive text goes here.")
                
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
