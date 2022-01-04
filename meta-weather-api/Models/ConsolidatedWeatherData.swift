import Foundation
import ObjectMapper

struct ConsolidatedWeatherData: Mappable {
    private var date: String = ""
    private var weatherState: String = ""
    private var maxTemp: Double = 0
    private var minTemp: Double = 0
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        date <- map["applicable_date"]
        weatherState <- map["weather_state_abbr"]
        maxTemp <- map["max_temp"]
        minTemp <- map["min_temp"]
    }
    
    func getDate() -> String {
        return date
    }
    
    func getImageBasedOnTheState() -> String {
        return weatherState
    }
    
    func getMaxTemperature() -> String {
        return String(format: "%.1f", maxTemp) + "°C"
    }
    
    func getMinTemperature() -> String {
        return String(format:"%.1f", minTemp) + "°C"
    }
}
