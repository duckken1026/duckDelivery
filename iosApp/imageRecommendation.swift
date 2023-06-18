//
//  imageRecommendation.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/6/13.
//

import SwiftUI
import PhotosUI
import CoreML

struct imageRecommendation: View {
    @State var isShowing = false
    @State var isShowingModal = false
    @State private var isLoading = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    var body: some View {
        ZStack{
            
            VStack{
                ZStack{
                    Image("")
                        .resizable()
                        .frame(height: 300)
                    if let selectedPhotoData,
                       let image = UIImage(data: selectedPhotoData) {
                        
                        Image(uiImage: image)
                            .resizable()
                            //.scaledToFill()
                            //.clipped()
                            .frame(height: 300)
                        
                    }
                }
                
                PhotosPicker(selection: $selectedItem, matching: .any(of: [.images, .not(.livePhotos)])) {
                    Label("選擇一張圖片", systemImage: "photo")
                }
                .tint(.purple)
                .controlSize (.large)
                .buttonStyle(.borderedProminent)
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedPhotoData = data
                        }
                    }
                }
                Button(action: {
                    // 按鈕被點擊後的處理程式碼
                    isLoading = true
                    
                    // 載入時間
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    isLoading = false
                    isShowingModal = true
                    }
                }) {
                    Text("開始分析")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
            }
            .sheet(isPresented: $isShowingModal) {
                        // 彈出的視窗內容
                        ModalView()
                }
            if isLoading {
                VStack{
                    ProgressView() // 載入進度條
                    .progressViewStyle(CircularProgressViewStyle())
                    .controlSize(.large)
                    .scaleEffect(2)
                    .shadow(color: Color(red: 0, green: 0, blue: 0.6), radius: 43.0, x: 1.0, y: 2.0)
                    .padding()
                    .padding()
                    .padding()
                    .background(Color(red: 220/255, green: 220/255, blue: 220/255))
                    .cornerRadius(10)
                    Text("載入中...")
                        .padding(.top,-36)
                }
                    
            }
        }
        
    }
}
struct imageRecommendation_Previews: PreviewProvider {
    static var previews: some View {
        imageRecommendation()
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        recommendation()
    }
}
