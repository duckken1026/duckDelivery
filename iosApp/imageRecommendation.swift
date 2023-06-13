//
//  imageRecommendation.swift
//  iosApp
//
//  Created by 鄭傳脩 on 2023/6/13.
//

import SwiftUI

struct imageRecommendation: View {
    @State var isShowing = false
        
        var body: some View {
            
            VStack {
                Button {
                    isShowing.toggle()
                } label: {
                    Text("documents")
                }
                .fileImporter(isPresented: $isShowing, allowedContentTypes: [.item], allowsMultipleSelection: true, onCompletion: { results in
                    
                    switch results {
                    case .success(let fileurls):
                        print(fileurls.count)
                        
                        for fileurl in fileurls {
                            print(fileurl.path)
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                })

            }
            
        }
}

struct imageRecommendation_Previews: PreviewProvider {
    static var previews: some View {
        imageRecommendation()
    }
}
