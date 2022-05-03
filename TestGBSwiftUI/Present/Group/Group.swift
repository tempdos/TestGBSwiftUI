//
//  Group.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 26.04.2022.
//

import SwiftUI

struct Group: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        GroupImage {
                            Image("gb")
                        }
                    }
                    Text("GeekBrains")
                        .frame(width: 90, height: 30)
                }.padding(5)
                Spacer()
            }
            Spacer()
        }
    }
}

struct Group_Previews: PreviewProvider {
    static var previews: some View {
        Group()
    }
}

struct GroupShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(Color.blue)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
}

struct GroupImage: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90, alignment: .center)
            .cornerRadius(40)
            .padding(2)
            .modifier(GroupShadow(shadowColor: .blue, shadowRadius: 1))
    }
}
