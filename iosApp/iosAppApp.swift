

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@main
struct DemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    let accountManager = loginAndRegister()
    var body: some Scene {
        WindowGroup {
           pageManager()
        }
    }
}
