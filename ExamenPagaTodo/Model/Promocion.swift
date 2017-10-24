import UIKit

class Promocion: NSObject {
    
    var img: String!
    var title: String!
    
    override init() {
    }
    
    init(img: String, title: String) {
        
        self.img = img
        self.title = title
      
    }
    
}
