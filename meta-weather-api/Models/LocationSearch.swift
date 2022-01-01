import Foundation
import ObjectMapper

struct LocationSearch: Mappable {
    private var title: String = ""
    private var locationType: String = ""
    private var woeid: Int = 0
    private var lattLong: String = ""
    
    init() {}
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        locationType <- map["location_type"]
        woeid <- map["woeid"]
        lattLong <- map["latt_long"]
    }
    
    private func getTitle() -> String {
        return title
    }
    
    private func getLocationType() -> String {
        return locationType
    }
    
}
