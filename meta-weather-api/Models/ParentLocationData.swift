import Foundation
import ObjectMapper

struct ParentLocationData: Mappable {
    private var title: String = ""
    private var locationType: String = ""
    private var woeid: Int = 0
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        locationType <- map["location_type"]
        woeid <- map["woeid"]
    }
    
    func getTitle() -> String {
        return title
    }
}
