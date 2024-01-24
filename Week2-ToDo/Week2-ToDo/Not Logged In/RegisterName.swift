//
//  SwiftUIView.swift
//  Week2-ToDo
//
//  Created by Cole Sherman on 1/23/24.
//

import SwiftUI

struct RegisterName: View {
    
    @State private var username: String = ""
    @State var text = ""
    @State var emptyUser = false
    @State private var animateGradient: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                
                Text("Welcome to the To-Do App!")
                    .foregroundColor(.white)
                Text("To get started, please enter your name below:")
                    .foregroundColor(.white)
                HStack {
                    TextField("", text: $text)
                }.modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .white, textColor: .cyan)).frame(width: UIScreen.main.bounds.width - 50)

                
                Spacer()
                
                NavigationLink {
                    if !text.isEmpty {
                        ContentView()
                    }
                } label: {
                    Button("Get Started!", action: {
                        emptyUser = self.text.isEmpty
                        self.username = text
                        let defaults = UserDefaults.standard
                        defaults.set(username, forKey: "Username")
                    })
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color.white).cornerRadius(10).foregroundColor(.cyan).frame(minWidth: UIScreen.main.bounds.width - 100)

                }
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .background{
                LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .topTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
            }

        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterName()
    }
}
