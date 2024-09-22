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
                .clipShape(.rect(cornerRadius: 5))
            
            VStack(alignment:.leading) {
                Text(landmark.name)
                    .foregroundStyle(.foreground)
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                #endif
            }
            
            Spacer()
            
            if(landmark.isFavorite){
                Image(systemName:"heart.fill").foregroundStyle(.red)
            }
        }
        .padding(.vertical,4)
    }
}


#Preview{
    let landmarks = ModelData().landmarks
    return Group{
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}



struct Previews_LandmarkRow_LibraryContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/)
    }
}
