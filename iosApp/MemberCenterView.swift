import SwiftUI

struct MemberCenterView: View {
    var body: some View {
        NavigationView(){
            VStack {
                Image("google") // 替換為用戶頭像的圖片名稱
                    .resizable()
                    .frame(width: 150, height: 150) // 調整頭像大小
                    .clipShape(Circle())
                    .padding(.top, 100) // 調整頭像上方的間距
                
                Text("Thao Ma") // 替換為用戶姓名
                    .font(.largeTitle)
                    .padding(.top, 30) // 調整姓名上方的間距
                
                Text("Thaolyly97@gmail.com") // 替換為用戶電子郵件地址
                    .font(.title3)
                    .padding(.top, 10) // 調整電子郵件地址上方的間距
                
                Divider()
                    .padding(.top, -10) // 調整分隔線上方的間距
                
                VStack(alignment: .leading) {
                    Text("會員資訊: 新會員") // 會員資訊標題
                        .font(.title)
                        .padding(.bottom, 10) // 調整標題底部的間距
                    
                    Text("會員等級：1") // 替換為用戶的會員等級
                        .font(.largeTitle)
                    
                    Text("積分：5") // 替換為用戶的會員積分
                        .font(.largeTitle)
                        .padding(.bottom, 10) // 調整標題底部的間距
                    // 可以根據需要添加更多會員資訊
                    
                    Text("選項:") // 會員資訊標題
                        .font(.title)
                        .padding(.bottom, 10) // 調整標題底部的間距
                    HStack{
                        Button(action: {
                                        // 處理購物紀錄按鈕被點擊後的動作
                                        // 例如，導航到購物紀錄畫面
                                    }) {

                                        NavigationLink( destination:shopingCart(),
                                            label: {
                                            Text("查看購物紀錄")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(  LinearGradient(
                                                    gradient: Gradient(colors: [Color.blue, Color.red]), // 指定漸層顏色
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                ))
                                                .cornerRadius(10)
                                            })
                                    }
                                    .padding(.bottom, 30)
                        Button(action: {
                                        // 處理購物紀錄按鈕被點擊後的動作
                                        // 例如，導航到購物紀錄畫面
                                    }) {
                                        Text("商家評分")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(  LinearGradient(
                                                gradient: Gradient(colors: [Color.green, Color.yellow]), // 指定漸層顏色
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ))
                                            .cornerRadius(10)
                                    }
                                    .padding(.bottom, 30)
                    }
                    
                    
                
                }
                .padding(.top, 30) // 調整會員資訊區塊上方的間距
                
                Spacer()
            }
            
            .padding(30) // 調整整體內容的間距
            .background(LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.white,Color(red: 1, green: 1, blue: 150/255)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )) // 設定背景顏色為粉色
            .edgesIgnoringSafeArea(.all) // 忽略安全區域邊緣
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberCenterView()
    }
}
