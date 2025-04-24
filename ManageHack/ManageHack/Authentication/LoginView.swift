//
//  LoginView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/22/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State var authVM = Auth()
    @State private var loginError: String? = nil
    @State private var isLogined: Bool = false
    @State var currentParti: Participant = Participant(name: "", email: "", points: 0, password: "")

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 25) {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 130)
                    .overlay(
                        Image(systemName: "person.text.rectangle")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )

                Text("ManageHack")
                    .font(.largeTitle)
                    .bold()

                VStack {
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 60)

                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 60)

                    
                    if let loginError = loginError {
                        Text(loginError)
                            .foregroundColor(.red)
                            .font(.headline)
                            .padding(.top, 10)
                    }
                }

                HStack(spacing: 40) {
                    Button {
                        if authVM.userExist(username: username) {
                            if authVM.passwordCorrect(username: username, password: password) {
                                loginError = nil
                                currentParti = authVM.getUser(username: username)
                                isLogined = true
                                // Navigate or show next screen
                            } else {
                                loginError = "Incorrect Password!"
                            }
                        } else {
                            loginError = "User does not exist, Sign up first!"
                        }
                    } label: {
                        Text("LOGIN")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("light"))
                    .navigationDestination(isPresented: $isLogined) {
                        ParticipantHomeView(participant: currentParti)
                    }


                    NavigationLink(destination: SignupView(authVM: authVM)) {
                        Text("SIGN UP")
                            .tint(Color("light"))
                    }
                }
                //.padding(.vertical, 50)
                
                NavigationLink(){
                    
                } label:{
                    Text("Host Login")
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
