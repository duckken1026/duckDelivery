//
//  registerAndLoginManager.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/4.
//

import SwiftUI
import FirebaseAuth

struct pageManager: View {
    @State var currentScreen = "Login"//註冊和登入畫面切換
    var body: some View {
        ZStack{
            if currentScreen == "Login" {
                Login(currentScreen: self.$currentScreen)
            }
            else if currentScreen == "Register"{
                Register(currentScreen: self.$currentScreen)
            }
            else if currentScreen == "contentView"{
                ContentView(currentScreen: self.$currentScreen)
            }
            else if currentScreen == "welcomePage"{
                welcomePage(text: "歡迎使用鴨鴨訂餐！", image: "welcome_balloon")
            }
            else if currentScreen == "registerSuccessPage"{
                welcomePage(text: "註冊成功！",image: "welcome_balloon")
            }
            else if currentScreen == "thank you"{
                welcomePage(text: "歡迎下次光臨！",image: "message_thank_you")
            }
            else{
                errorPage(currentScreen: self.$currentScreen)
            }
        }
    }
}

struct pageManager_Previews: PreviewProvider {
    static var previews: some View {
        pageManager()
    }
}
