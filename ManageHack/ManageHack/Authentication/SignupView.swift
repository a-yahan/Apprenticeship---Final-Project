//
//  SignupView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/22/25.
//

import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Bindable var authVM: Auth
    @State private var shouldNavigateToLogin = false

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Email", text: $email)
                TextField("Password", text: $password)
            }
            .navigationTitle("Register an Account")
            .navigationBarTitleDisplayMode(.large)
            .overlay(
                VStack {
                    Button {
                        let newParticipant = Participant(name: name, email: email, points: 0, password: password)
                        if authVM.registerUser(username: newParticipant.name, participant: newParticipant) {
                            shouldNavigateToLogin = true
                        }
                        name = ""
                        email = ""
                        password = ""
                    } label: {
                        Text("REGISTER")
                            .font(.title3)
                    }
                    .padding(.top, 50)
                    .navigationDestination(isPresented: $shouldNavigateToLogin) {
                        LoginView()
                    }
                }
            )
        }
    }
}

#Preview {
    @Previewable @Previewable @State var sampleAuth = Auth()
    SignupView(authVM: sampleAuth)
}
