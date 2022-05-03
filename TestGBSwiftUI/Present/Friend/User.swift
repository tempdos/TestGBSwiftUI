//
//  User.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 26.04.2022.
//

import SwiftUI

struct User: View {
    
    var user: UserResponse
    
    var body: some View {
        HStack {
            UserImage {
                Image(user.image)
            }
            Text(user.name)
                .font(.title)
                .padding(.leading)
            Spacer()
        }
    }
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User(user: userResponse[0])
    }
}

struct UserShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(Color.gray)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
}

struct UserImage: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80, alignment: .center)
            .cornerRadius(40)
            .padding(1)
            .modifier(UserShadow(shadowColor: .white, shadowRadius: 1))
    }
}
