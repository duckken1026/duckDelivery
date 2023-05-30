//
//  databaseOperator.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/8.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class databaseOperator{
    
    func addStock(collection: String,document: String){//新增庫存
        let db = Firestore.firestore()
            let documentReference =
            db.collection(collection).document(document)
            documentReference.getDocument { [self] document, error in
                
                guard let document,
                      document.exists,
                      var food = try? document.data(as: foods.self)
                else {
                    return
                }
                let currentStock = food.stock//目前庫存數
                food.stock = plusOneToNumber(num: currentStock)
                do {
                    try documentReference.setData(from: food)
                } catch {
                    print(error)
                }
                
            }
    }
    
    func buyFood(collection: String,document: String){//購買
        let db = Firestore.firestore()
            let documentReference =
            db.collection(collection).document(document)
            documentReference.getDocument { [self] document, error in
                
                guard let document,
                      document.exists,
                      var food = try? document.data(as: foods.self)
                else {
                    return
                }
                let currentStock = food.stock//目前庫存數
                food.stock = minusOneToNumber(num: currentStock)
                do {
                    try documentReference.setData(from: food)
                } catch {
                    print(error)
                }
                
            }
    }
    
    func addToTotal(foodName:String,foodPrice:Int,foodStock:Int,foodImage:String){//加入到總結清單中
        let db = Firestore.firestore()
        if(foodStock > 0){
            let food = foods(id: "1",name: foodName,price: foodPrice,stock: 1, image: foodImage,detail: "")
            do {
                let documentReference = try db.collection("total").addDocument(from: food)
                //print(documentReference.documentID)
            } catch {
                print(error)
            }
        }
    }
    
    func deleteFromCart(id:String){//從購物車中刪除
        let db = Firestore.firestore()
        let documentReference = db.collection("total").document(id)
        documentReference.delete()
    }
    
    func plusOneToNumber(num: Int) -> Int{//將數字加一
        var result = 0
        result = num + 1
        return result
    }
    
    func minusOneToNumber(num: Int) -> Int{//將數字減一
        var result = 0
        if(num > 0){
            result = num - 1
        }
        else{
           result = num
        }
        return result
    }
}
