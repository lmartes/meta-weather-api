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
        return formatDate(date: time)
    }
    
    func getSunrise() -> String {
        return formatDate(date: sunrise)
    }
    
    func getSunset() -> String {
        return formatDate(date: sunset)
    }
    
    func getConsolidateWeather() -> [ConsolidatedWeatherData] {
        return consolidatedWeather
    }
    
    private func formatDate(date: String) -> String {
        return time.format(with: "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZZZZZ", outFormat: "HH:mm a")
    }
}
