//
//  shopingCart.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/8.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct shopingCart: View {
    @FirestoreQuery(collectionPath: "total") var total: [foods]
    let database = databaseOperator()
    var body: some View {
        ScrollView {
            ForEach(total) { item in
                ZStack{
                    Image("background")
                        .resizable()
                    HStack {
                        AsyncImage(url: URL(string:
                            item.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        VStack{
                            Text(item.name)
                            Image("deleteButton")
                                .onTapGesture {
                                    database.deleteFromCart(id: item.id!)
                                }
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("價格:"+String(item.price))
                            Text("數量:"+"\(item.stock)")
                        }
                    }
                    .padding(50)
                }
                .padding(.bottom,-60)
            }
        }
        .navigationTitle("購物車")
    }
}

struct shopingCart_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            shopingCart()
        }
    }
}
