

import FirebaseFirestoreSwift

struct foods: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let price: Int
    var stock: Int
    let image: String
    let detail: String
}
