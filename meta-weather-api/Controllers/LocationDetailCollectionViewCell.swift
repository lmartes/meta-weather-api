import UIKit

class LocationDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var imageState: UIImageView!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    private var locationManager: LocationManager = LocationManager()
    private var downloadedImage: UIImage = UIImage()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationManager.delegate = self
    }
    
    func setupView(data: ConsolidatedWeatherData) {
        downloadImageBasedOnTheWeatherState(weatherState: data.getweatherState())
        date.text = data.getDate()
        maxTemp.text = data.getMaxTemperature()
        minTemp.text = data.getMinTemperature()
    }
    
    private func downloadImageBasedOnTheWeatherState(weatherState: String) {
        locationManager.fetchImageBasedOnTheState(state: weatherState)
    }
}

//MARK: - Location Delegate
extension LocationDetailCollectionViewCell: LocationDelegate {
    func didUpdateImageFailWithError(error: Error) {
        imageState.image = UIImage(named: "meta-weather-default-icon")
    }
    
    func didUpdateImage(data: Data) {
        imageState.image = UIImage(data: data)
    }
}
