import Foundation
import Alamofire
import ObjectMapper

struct LocationSearchManager {
    var delegate: LocationSearchDelegate?
    
    func searchLocation(location: String) {
        let searchLocationURL = "https://www.metaweather.com/api/location/search/?query=\(location)"
        AF.request(searchLocationURL).response { (response) in
            handleResponse(requestResponse: response)
        }
    }
    
    private func handleResponse(requestResponse: AFDataResponse<Data?>) {
        if let error = requestResponse.error {
            delegate?.didFailWithError(error: error)
            return
        }
        
        if let data = requestResponse.data {
            delegate?.didUpdateLocationSearch(data: parseJSON(data))
        }
    }
    
    private func parseJSON(_ weatherData: Data) -> [LocationSearchResponse] {
        let data = String(decoding: weatherData, as: UTF8.self)
        guard let decoderData = Mapper<LocationSearchResponse>().mapArray(JSONString: data) else {
            print("parseJSON Error: Could not map response")
            return []
        }
        return decoderData
    }
}
