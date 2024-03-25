//
//  LogIn.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 3/18/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullName = ""
    @State private var isLogin = true
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            Text(isLogin ? "Login" : "Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)

            if !isLogin {
                TextField("Full Name", text: $fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)

            if !isLogin {
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }

            Button(action: isLogin ? login : createAccount) {
                Text(isLogin ? "Login" : "Create Account")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Button(action: toggleLoginStatus) {
                Text(isLogin ? "Create an Account" : "Already have an account? Login")
                    .foregroundColor(.blue)
                    .padding(.top, 10)
            }

            Text(errorMessage)
                .foregroundColor(.red)
                .padding(.top, 10)
        }
        .padding()
    }

    func toggleLoginStatus() {
        isLogin.toggle()
        errorMessage = ""
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    // Login successful
                    // Proceed with any additional setup or navigation after successful login
                }
            }
    }

    func createAccount() {
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    // Account created successfully
                    // Optionally, you can also update the user's display name
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = fullName
                    changeRequest?.commitChanges(completion: nil)

                    // Proceed with any additional setup or navigation after account creation
                }
            }
        } else {
            errorMessage = "Passwords do not match"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

