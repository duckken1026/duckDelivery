import SwiftUI
import UIKit

struct camera: View {
    @State private var isShowingCamera = true
    @State var isShowingModal = false
    @State private var image: Image?
    @State private var isLoading = false
    var body: some View {
        ZStack{
            VStack {
                // 畫面內容...
                
                Button(action: {
                    isShowingCamera = true
                }) {
                    Text("打開相機")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShowingCamera, onDismiss: {
                    // 在相機關閉後執行的程式碼
                    isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                        isLoading = false
                        isShowingModal = true
                    }
                }) {
                    CameraView(image: $image)
                }
                .sheet(isPresented: $isShowingModal) {
                            // 彈出的視窗內容
                            ModalView()
                    }
                // 顯示拍攝的照片
                image?.resizable().scaledToFit()
            }
            .padding(30)
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

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: Image?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(image: $image)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: Image?
        
        init(image: Binding<Image?>) {
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                image = Image(uiImage: uiImage)
            }
            
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

struct camera_Previews: PreviewProvider {
    static var previews: some View {
        camera()
    }
}
