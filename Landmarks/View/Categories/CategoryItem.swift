//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Sundet Mukhtar on 12.09.2024.
//

import SwiftUI

struct CategoryItem: View {
    var landmark:Landmark;
    
    var body: some View {
        VStack(alignment: .leading){
            landmark.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 155)
                .clipShape(.rect(cornerRadius: 5))
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
            
        }.padding(.leading,15)
    }
}

#Preview {
    CategoryItem(landmark:ModelData().landmarks[0])
}
