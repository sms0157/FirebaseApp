//
//  LoginView.swift
//  Notes
//
//  Created by Sabrina Summerfield on 4/16/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userLoggedIn = false
    
    var body: some View {
        if userLoggedIn {
            NotesView()
        } else {
            content
        }
      
    }
    
    var content: some View {
        ZStack {
            Color.teal
            VStack(spacing: 20) {
                Text("Hello!")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
                Spacer()
                    .frame(height: 100)
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .bold()
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .bold()
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 100, height: 25)
                .background(RoundedRectangle(cornerRadius: 5)
                    .fill(.blue))
                
                Button {
                    login()
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .bold()
                }
                    
                
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
