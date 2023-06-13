//
//  Homepage.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/6/13.
//

import SwiftUI

struct Homepage: View {
    @Binding var currentScreen:String
    var body: some View {
        TabView{
            ContentView(currentScreen: self.$currentScreen)
                .tabItem{
                    Label("訂餐",systemImage: "fork.knife")
                    
                }
            foodDetail(image: "", name: "abc", detail: "")
                .tabItem{
                    Label("心情推薦",systemImage: "heart")
                }
            foodDetail(image: "", name: "abc", detail: "")
                .tabItem{
                    Label("圖片偵測推薦",systemImage: "photo.artframe")
                }
            foodDetail(image: "", name: "abc", detail: "")
                .badge("!")
                .tabItem{
                    Label("會員中心",systemImage: "person.circle")
                }
        }
        
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage(currentScreen: .constant("Login"))
    }
}
