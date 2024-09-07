//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Sundet Mukhtar on 04.09.2024.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark:Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(.rect(cornerRadius: 3))
            Text(landmark.name)
            Spacer()
            
            if(landmark.isFavorite){
                Image(systemName:"heart.fill").foregroundStyle(.red)
            }
        }
    }
}


#Preview{
    let landmarks = ModelData().landmarks
    return Group{
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}


