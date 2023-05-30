//
//  welcomePage.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/9.
//

import SwiftUI

struct welcomePage: View {
    var text:String
    var image:String
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(width: 350,height: 250)
            Text(text)
                .font(.largeTitle)
        }
    }
}

struct welcomePage_Previews: PreviewProvider {
    static var previews: some View {
        welcomePage(text: "",image: "")
    }
}
