//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by Sundet Mukhtar on 22.09.2024.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData;
    @State private var showFavoritesOnly = false;

    var filteredLandmarks:[Landmark]{
        if(!showFavoritesOnly){
            return modelData.landmarks
        }else{
            return modelData.landmarks.filter { landmark in
                (landmark.isFavorite)
            }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){landmark in NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }}
            }.animation(.default, value:filteredLandmarks)
                .navigationTitle("Landmarks")
            
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
