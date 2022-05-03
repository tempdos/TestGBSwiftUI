//
//  FriendsView.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 03.05.2022.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        List(userResponse.sorted {
            $0.name < $1.name
        }) { user in
            NavigationLink(destination: GalleryPhoto(user: user)) {
                User(user: user)
            }
            
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
