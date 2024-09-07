//
//  CircleImage.swift
//  Landmarks
//
//  Created by Sundet Mukhtar on 04.09.2024.
//

import SwiftUI

struct CircleImage: View {
    var image:Image;
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white,lineWidth: 4)
            }.shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
