//
//  loginAndRegister.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import Foundation
import FirebaseAuth
import SwiftUI

class loginAndRegister{
    
    func registerAccount(email: String,password: String) -> String{//註冊帳號
        if(email == ""){//若沒有填email
            return "email-empty"
        }
        else if(password == ""){//若沒有填密碼
            return "password-empty"
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let user = result?.user,error == nil else{
                print("error")
            
                return
            }
            print("success")//成功註冊
            
        }
        if(isLogin() == true){
            return "true"
        }
        else{
            return "false"
        }
        
    }
    
    func loginAccount(email: String,password: String) -> String{//登入帳號
        if(email == ""){//若沒有填email
            return "email-empty"
        }
        else if(password == ""){//若沒有填密碼
            return "password-empty"
        }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    print("error")//輸入錯誤帳號密碼，登入失敗
                    return
                }
                print("success")//成功登入
        }
        if(isLogin() == true){
            return "true"
        }
        else{
            return "false"
        }
    }
    
    func isLogin() -> Bool{
        Auth.auth().addStateDidChangeListener { auth, user in
           if let user {
               //print("\(user.uid) login")
           } else {
               //print("not login")
           }
        }
        if let user = Auth.auth().currentUser {
            //print("\(user.uid) login")
            return true
        } else {
            return false
            //print("not login")
        }
    }
    
    func logout(){//登出帳號
        do {
           try Auth.auth().signOut()
        } catch {
           print(error)
        }
    }
    

}
