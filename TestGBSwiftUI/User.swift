//
//  User.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 26.04.2022.
//

import SwiftUI

struct User: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        UserImage {
                            Image("user")
                        }
                    }
                    Text("Дуров")
                        .frame(width: 90, height: 30)
                }.padding(5)
                Spacer()
            }
            Spacer()
        }
    }
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User()
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
