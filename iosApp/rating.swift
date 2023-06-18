import SwiftUI

struct rating: View {
    @Binding var rating: Int
    
    let maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1) { index in
                self.image(for: index)
                    .foregroundColor(index > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
    
    func image(for index: Int) -> Image {
        if index > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}



struct rating_Previews: PreviewProvider {
    static var previews: some View {
        rating(rating: .constant(3))
    }
}
