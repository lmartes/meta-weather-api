import Foundation
import ObjectMapper

struct LocationResponse: Mappable {
    private var locationTitle: String = ""
    private var parent: ParentLocationData = ParentLocationData()
    private var time: String = ""
    private var sunrise: String = ""
    private var sunset: String = ""
    private var consolidatedWeather: [ConsolidatedWeatherData] = []
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        locationTitle <- map["title"]
        parent <- map["parent"]
        time <- map["time"]
        sunrise <- map["sun_rise"]
        sunset <- map["sun_set"]
        consolidatedWeather <- map["consolidated_weather"]
    }
    
    func getTitle() -> String {
        return locationTitle
    }
    
    func getParentTitle() -> String {
        return parent.getTitle()
    }
    
    func getTime() -> String {
        return time
    }
    
    func getSunrise() -> String {
        return sunrise
    }
    
    func getSunset() -> String {
        return sunset
    }
    
    func getConsolidateWeather() -> [ConsolidatedWeatherData] {
        return consolidatedWeather
    }
}
