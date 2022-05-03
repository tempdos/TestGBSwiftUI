//
//  GalleryPhoto.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 03.05.2022.
//

import SwiftUI

struct GalleryPhoto: View {
    var user: UserResponse
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top, content: {
                let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
                LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                    ForEach(user.photos) { photo in
                        OneImage {
                            Image(photo.filename)
                        }
                    }
                }
            })
        }
    }
}

struct GalleryPhoto_Previews: PreviewProvider {
    static var previews: some View {
        GalleryPhoto(user: userResponse[2])
    }
}

struct OneImage: View {
    
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .frame(width: 110, height: 110)
            .clipped()
            .border(Color.gray, width: 1)
    }
}
