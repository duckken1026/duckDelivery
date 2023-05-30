//
//  error.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/8.
//

import SwiftUI

struct errorPage: View {
    @Binding var currentScreen:String
    var body: some View {
        VStack{
            Image("Illu404")
                .resizable()
                .frame(width: 350,height: 350)
            Text("請輸入正確格式！")
                .font(.largeTitle)
        }
       
    }
}

struct errorPage_Previews: PreviewProvider {
    static var previews: some View {
        errorPage(currentScreen: .constant("error"))
    }
}
