//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Sundet Mukhtar on 19.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(width: 700, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
