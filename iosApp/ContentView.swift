//
//  ContentView.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/5/1.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

struct ContentView: View {
    @Binding var currentScreen:String
    @StateObject var icon = iconManager()
    @State var foodType = "noodles"
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 249/255, green: 252/255, blue: 254/255)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("歡迎使用鴨鴨訂餐")
                        Button("登出"){
                            do {
                               try Auth.auth().signOut()
                               currentScreen = "thank you"
                               print("out")
                            } catch {
                               print(error)
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                currentScreen = "Login"
                            }
                        }
                    }
                    .padding(.leading,-177)
                    .padding(.bottom,-10)
                    
                    ZStack{
                        Image("barBackground")
                        HStack{
                            Image(icon.noodleIcon)
                                .padding(.top,-20)
                                .onTapGesture {
                                    icon.turnBlackIcon(icon: "noodle")
                                    print("noodle")
                                    foodType = "noodles"
                                }
                            Image(icon.pizzaIcon)
                                .padding(.leading,25)
                                .padding(.top,-15)
                                .onTapGesture {
                                    icon.turnBlackIcon(icon: "pizza")
                                    print("pizza")
                                    foodType = "pizza"
                                }
                            Image(icon.drinkIcon)
                                .padding(.leading,10)
                                .padding(.top,-25)
                                .onTapGesture {
                                    icon.turnBlackIcon(icon: "drink")
                                    print("drink")
                                    foodType = "drinks"
                                }
                            Image(icon.friedFoodIcon)
                                .padding(.leading,10)
                                .padding(.top,-20)
                                .onTapGesture {
                                    icon.turnBlackIcon(icon: "friedFood")
                                    print("friedFood")
                                    foodType = "foods"
                                }
                            Image(icon.iceCreamIcon)
                                .padding(.leading,10)
                                .padding(.top,-20)
                                .onTapGesture {
                                    icon.turnBlackIcon(icon: "iceCream")
                                    print("iceCream")
                                    foodType = "iceCream"
                                }
                        }
                    }
                    .padding(.bottom,-30)
                    HStack{
                        Text(icon.getFoodTypeName(icon: foodType))
                            .font(.largeTitle)
                            .padding(.leading,60)
                        Spacer()
                        NavigationLink( destination:shopingCart(),
                            label: {
                            Text("購物車")
                                .font(.title2)
                                .padding(.trailing,60)
                            })
                    }
                    foodScrollView(foodType: self.$foodType)
                        .padding(.top,-9)
                    
                }
            }
            
            .navigationTitle("哈囉!")
            
        }
        
            
            
        
    }
                    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentScreen: .constant("Login"))
    }
}
