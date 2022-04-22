//
//  ContentView.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 21.04.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(NotificationCenter.default.publisher(for: UIResponder.keyboardDidChangeFrameNotification).map { _ in true }, NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification).map { _ in false }).removeDuplicates()
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                HStack {
                    if shouldShowLogo {
                        Text("ВКонтакте")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }.padding(.top, 50)
                
                VStack(alignment: .trailing) {
                    HStack {
                        Text("Логин")
                            .foregroundColor(.white)
                        TextField("", text: $login)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack {
                        Text("Пароль")
                            .foregroundColor(.white)
                        SecureField("", text: $password)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                }.padding(.top, 200)
                HStack {
                    Button(action: { print("Hello") }) {
                        Text("Войти")
                    }
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.shouldShowLogo = !isKeyboardOn
            }
                
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
