//
//  foodDetail.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/9.
//

import SwiftUI

struct foodDetail: View {
    var image:String
    var name:String
    var detail:String
    var body: some View {
        VStack(){
            Text(name)
                .font(.largeTitle)
            AsyncImage(url: URL(string:
                image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 300)
            ScrollView{
                Text(detail)
            }.frame(height: 150)
            Image("ARveiw2")
                .resizable()
                .frame(width: 70, height: 50)
                .onTapGesture {
                    
                }
        }
        .padding(.top,-100)
        
    }
}

struct foodDetail_Previews: PreviewProvider {
    static var previews: some View {
        foodDetail(image:"",name:"食物名字",detail: "食物介紹")
    }
}
