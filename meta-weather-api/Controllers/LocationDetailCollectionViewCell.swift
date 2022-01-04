import UIKit

class LocationDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var imageState: UIImageView!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(data: ConsolidatedWeatherData) {
        date.text = data.getDate()
        //imageState.image = UIImage(data: <#T##Data#>)
        maxTemp.text = data.getMaxTemperature()
        minTemp.text = data.getMinTemperature()
    }
}
