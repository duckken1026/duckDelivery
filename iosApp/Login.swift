//
//  Login.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import Firebase

struct Login: View {
    @Binding var currentScreen:String
    @State private var email = ""//email
    @State private var password = ""//密碼
    @State private var showAlert = false
    @State private var alertTitle = ""
    let loginManager = loginAndRegister()
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    private func signInWithGoogle() {
        Task {
          if await viewModel.signInWithGoogle() == true {
            dismiss()
          }
        }
      }
    var body: some View {
        VStack{
            Image("Group 3")
               .padding(-40)
            Image("loginTitle")
                .padding(40)
            Image("E-mail Title")
                .padding(.leading,-160)
                .padding(.top,-8)
            ZStack{
                Image("your name")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的E-mail", text: $email, prompt: Text("你的E-mail"))
                    .padding(.leading,100)
                    .keyboardType(.emailAddress)
            }
            Image("PasswordTitle2")
                .padding(.leading,-160)
                .padding(.top,10)
            ZStack{
                Image("password")
                    .padding(.leading,-10)
                    .padding(.top,10)
                TextField("你的密碼", text: $password, prompt: Text("你的密碼"))
                    .padding(.leading,100)
                    .keyboardType(.default)
            }
            HStack {
                VStack { Divider() }
                Text("or")
                VStack { Divider() }
            }
            .padding(.top,5)
            Button(action: signInWithGoogle) {
                Text("Sign in with Google")
                    .frame(maxWidth: 290)
                    .padding(.vertical,8)
                    //.foregroundColor(ColorScheme == .dark ? .white : .black)
                    .background(alignment : .leading){
                        Image("google")
                            .resizable()
                            .frame(width: 30,height:30,alignment: .leading)
                    }
            }
            .padding(.top,10)
            .padding(.leading,-10)
            .buttonStyle(.bordered)

            

            Image("button")
                .padding(.top,20)
                .padding(.leading,-10)
                .onTapGesture {
                    Auth.auth().signIn(withEmail: $email.wrappedValue, password: $password.wrappedValue) { result, error in
                            guard error == nil else {
                                print("error")//輸入錯誤帳號密碼，登入失敗
                                currentScreen = "error"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    currentScreen = "Login"
                                }
                                return
                            }
                            print("success")//成功登入
                            currentScreen = "welcomePage"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                currentScreen = "contentView"
                            }
                    }
                }
            
            Image("Don’t have an account")
                .padding(.top,20)
                .onTapGesture {
                    currentScreen = "Register"
                }
           // Spacer()
        }
        .ignoresSafeArea()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(currentScreen: .constant("Login"))
    }
}

