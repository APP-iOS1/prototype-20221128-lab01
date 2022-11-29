import Foundation

struct Response: Codable {

  var total    : Int?      = nil
  var page     : Int?      = nil
  var pageSize : Int?      = nil
  var cursor   : String?   = nil
  var result   : [Result]? = []
  var status   : String?   = nil

  enum CodingKeys: String, CodingKey {

    case total    = "total"
    case page     = "page"
    case pageSize = "page_size"
    case cursor   = "cursor"
    case result   = "result"
    case status   = "status"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    total    = try values.decodeIfPresent(Int.self      , forKey: .total    )
    page     = try values.decodeIfPresent(Int.self      , forKey: .page     )
    pageSize = try values.decodeIfPresent(Int.self      , forKey: .pageSize )
    cursor   = try values.decodeIfPresent(String.self   , forKey: .cursor   )
    result   = try values.decodeIfPresent([Result].self , forKey: .result   )
    status   = try values.decodeIfPresent(String.self   , forKey: .status   )
 
  }

  init() {

  }

}
