import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var frontImg: String
    var backImg: String
    
}

var posts = [
    
    Post(frontImg:"NFTcard2",backImg:"NFTcard4"),
    Post(frontImg:"NFTcard1",backImg:"NFTcard4"),
    Post(frontImg:"NFTcard3",backImg:"NFTcard5"),
    Post(frontImg:"NFTcard4",backImg:"NFTcard4")
]
