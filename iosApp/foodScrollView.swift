//
//  foodScrollView.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/7.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct foodScrollView: View {
    @Binding var foodType:String
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
        if(foodType == "noodles"){
            ScrollView {
                ForEach(noodles) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "noodles", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "noodles", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
        else if(foodType == "pizza"){
            ScrollView {
                ForEach(pizza) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "pizza", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "pizza", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
        else if(foodType == "drinks"){
            ScrollView {
                ForEach(drinks) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "drinks", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "drinks", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
        else if(foodType == "foods"){
            ScrollView {
                ForEach(foods) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "foods", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "foods", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
        else if(foodType == "iceCream"){
            ScrollView {
                ForEach(iceCream) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "iceCream", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "iceCream", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
    else if(foodType == "tool"){
            ScrollView {
                ForEach(tool) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "Tool", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "Tool", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
        else if(foodType == "shoes"){
            ScrollView {
                ForEach(shoes) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "Shoes", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "Shoes", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
        else if(foodType == "furniture"){
            ScrollView {
                ForEach(furniture) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "furniture", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "furniture", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
        else if(foodType == "flower"){
            ScrollView {
                ForEach(flower) { food in
                    ZStack{
                        NavigationLink{
                            foodDetail(image:food.image,name:food.name,detail: food.detail)
                        }label: {
                            Image("background")
                                .resizable()
                        }
                        HStack {
                            AsyncImage(url: URL(string:
                                food.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            VStack{
                                Text(food.name)
                                Image("addButton")
                                    .frame(width: 130, height: 50)
                                    .padding(.bottom,-20)
                                    .onTapGesture {
                                        database.addStock(collection: "Flower", document: food.id!)
                                    }
                                Image("buyButton")
                                    .frame(width: 130, height: 50)
                                    .onTapGesture {
                                        database.buyFood(collection: "Flower", document: food.id!)
                                        database.addToTotal(foodName: food.name, foodPrice: food.price, foodStock: food.stock, foodImage: food.image)
                                    }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("價格:"+String(food.price))
                                Text("庫存:"+"\(food.stock)")
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
}


struct foodScrollView_Previews: PreviewProvider {
    static var previews: some View {
        foodScrollView(foodType:.constant("noodles"))
    }
}
