import Foundation
import Alamofire
import ObjectMapper

struct LocationManager {
    var delegate: LocationDelegate?
    
    func fetchLocation(woeid: Int) {
        let locationURL = "https://www.metaweather.com/api/location/\(woeid)"
        AF.request(locationURL).response { (response) in
            handleResponse(requestResponse: response)
        }
    }
    
    private func handleResponse(requestResponse: AFDataResponse<Data?>) {
        if let error = requestResponse.error {
            delegate?.didFailWithError(error: error)
            return
        }
        
        if let data = requestResponse.data {
            delegate?.didUpdateLocation(data: parseJSON(data))
        }
    }
    
    private func parseJSON(_ weatherData: Data) -> LocationResponse {
        let data = String(decoding: weatherData, as: UTF8.self)
        guard let decoderData = Mapper<LocationResponse>().map(JSONString: data) else {
            print("parseJSON Error: Could not map response")
            return LocationResponse()
        }
        return decoderData
    }
}
