//
//  foodScrollView.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/7.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct recommendation: View {
    @FirestoreQuery(collectionPath: "noodles") var noodles: [foods]
    @FirestoreQuery(collectionPath: "pizza") var pizza: [foods]
    @FirestoreQuery(collectionPath: "drinks") var drinks: [foods]
    @FirestoreQuery(collectionPath: "foods") var foods: [foods]
    @FirestoreQuery(collectionPath: "iceCream") var iceCream: [foods]
    @FirestoreQuery(collectionPath: "Tool") var tool: [foods]
    @FirestoreQuery(collectionPath: "Shoes") var shoes: [foods]
    @FirestoreQuery(collectionPath: "furniture") var furniture: [foods]
    @FirestoreQuery(collectionPath: "Flower") var flower: [foods]
    
    let database = databaseOperator()
    var body: some View {
        Text("推薦商品")
            .font(.largeTitle)
        if let randomElement = noodles.randomElement(){
            ScrollView {
                ZStack{
                    NavigationLink{
                        foodDetail(image:randomElement.image,name:randomElement.name,detail: randomElement.detail)
                    }label: {
                        Image("background")
                            .resizable()
                    }
                    HStack {
                        AsyncImage(url: URL(string:
                                                randomElement.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 100)
                        VStack{
                            Text(randomElement.name)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("價格:"+String(randomElement.price))
                            Text("庫存:"+"\(randomElement.stock)")
                        }
                    }
                    .padding(50)
                }
                .padding(.leading,25)
                .padding(.trailing,25)
                .padding(.bottom,-60)
            }
        }
        
    }

        
        
}


struct recommendation_Previews: PreviewProvider {
    static var previews: some View {
        recommendation()
    }
}
