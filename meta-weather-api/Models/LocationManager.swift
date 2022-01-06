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
    
    func fetchImageBasedOnTheState(state: String) {
        let imageURL = "https://www.metaweather.com/static/img/weather/png/\(state).png"
        AF.request(imageURL, method: .get).response { (response) in
            handleImageResponse(response: response)
        }
    }
    
    private func handleImageResponse(response: AFDataResponse<Data?>) {
        if let error = response.error {
            delegate?.didUpdateImageFailWithError(error: error)
        }
        
        if let data = response.data {
            delegate?.didUpdateImage(data: data)
        }
    }
    
}
