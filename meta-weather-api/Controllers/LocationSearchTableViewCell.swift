import UIKit

class LocationSearchTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var locationType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupView(data: LocationSearchResponse) {
        DispatchQueue.main.async {
            self.title.text = data.getTitle()
            self.locationType.text = data.getLocationType()
        }
    }

}
