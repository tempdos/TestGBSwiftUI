//
//  ContainerView.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 03.05.2022.
//

import Foundation
import SwiftUI

struct ContainerView: View {
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
                NavigationLink(destination: MainView(), isActive: $shouldShowMainView) {
                    EmptyView()
                }
            }
            
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}

