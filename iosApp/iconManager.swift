//
//  getIcon.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/6.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class iconManager : ObservableObject{
    
    @Published var noodleIcon = "noodleBlack"//麵的圖標
    @Published var pizzaIcon = "pizzaWhite"//披薩的圖標
    @Published var drinkIcon = "drinkWhite"//飲料的圖標
    @Published var friedFoodIcon = "friedFoodWhite"//炸物的圖標
    @Published var iceCreamIcon = "iceCreamWhite"//冰淇淋的圖標
    @Published var toolIcon = "ARview"//工具的圖標
    @Published var shoesIcon = "shoes1"//鞋子1
    @Published var furnitureIcon = "furniture"//鞋子1
    
    func turnBlackIcon(icon: String){//轉為黑色圖標
        resetIcon()
        if(icon == "noodle"){
            noodleIcon = "noodleBlack"
        }
        else if(icon == "pizza"){
            pizzaIcon = "pizzaBlack"
        }
        else if(icon == "drink"){
            drinkIcon = "drinkBlack"
        }
        else if(icon == "friedFood"){
            friedFoodIcon = "friedFoodBlack"
        }
        else if(icon == "iceCream"){
            iceCreamIcon = "iceCreamBlack"
        }
        else if(icon == "tool"){
            toolIcon = "ARview"
        }
        else if(icon == "shoes"){
            shoesIcon = "shoes1"
        }
        else if(icon == "furnitureIcon"){
            furnitureIcon = "furniture"
        }
    }
    
    func resetIcon(){//重設圖標
        noodleIcon = "noodleWhite"
        pizzaIcon = "pizzaWhite"
        drinkIcon = "drinkWhite"
        friedFoodIcon = "friedFoodWhite"
        iceCreamIcon = "iceCreamWhite"
        toolIcon = "ARview"
        shoesIcon = "shoes1"
        furnitureIcon = "furniture"
    }
    
    func getFoodTypeName(icon: String) -> String{//取得食物種類名稱
        if(icon == "noodles"){
            return "麵食"
        }
        else if(icon == "pizza"){
            return "披薩"
        }
        else if(icon == "drinks"){
            return "飲料"
        }
        else if(icon == "foods"){
            return "點心"
        }
        else if(icon == "iceCream"){
            return "冰淇淋"
        }
        else if(icon == "tool"){
            return "工具"
        }
        else if(icon == "shoes"){
            return "鞋子"
        }
        else if(icon == " furniture"){
            return "家具"
        }
        return ""
    }
    
}
