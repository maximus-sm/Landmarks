//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Sundet Mukhtar on 12.09.2024.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false;
    
    var body: some View {
        
        NavigationSplitView {
            List{
                PageView(pages: modelData.featured.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())

            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar(content: {
                Button(action: {
                    showingProfile.toggle()
                }, label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                })
            })
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
            })
            
        } detail: {
            Text("Select a Landmark")
        }

    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
