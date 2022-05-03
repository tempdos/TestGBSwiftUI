//
//  MainView.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 03.05.2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedView = "Друзья"
    
    var body: some View {
        TabView(selection: $selectedView) {
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2.circle")
                    Text("Друзья")
                } .tag("Друзья")
            Text("Группы")
                .tabItem {
                    Image(systemName: "command.circle")
                    Text("Группы")
                } .tag("Группы")
            Text("Новости")
                .tabItem {
                    Image(systemName: "newspaper.circle.fill")
                    Text("Новости")
                } .tag("Новости")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
