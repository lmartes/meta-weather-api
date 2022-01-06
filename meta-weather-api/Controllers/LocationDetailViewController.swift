import UIKit

class LocationDetailViewController: UIViewController {
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var parentTitle: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var locationSearchResponse: LocationSearchResponse = LocationSearchResponse()
    private var locationManager: LocationManager = LocationManager()
    private var location: LocationResponse = LocationResponse()
    private var consolidatedWeather: [ConsolidatedWeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        doRequestLocation()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        locationManager.delegate = self
    }
    
    private func doRequestLocation() {
        locationManager.fetchLocation(woeid: locationSearchResponse.getWoeid())
    }
    
    private func setupView() {
        showElementsView()
        locationTitle.text = location.getTitle()
        parentTitle.text = location.getParentTitle()
        time.text = location.getTime()
        sunrise.text = location.getSunrise()
        sunset.text = location.getSunset()
    }
    
    private func showElementsView() {
        headerView.isHidden = false
        collectionView.isHidden = false
    }

}

//MARK: - Location Delegate
extension LocationDetailViewController: LocationDelegate {
    func didUpdateLocation(data: LocationResponse) {
        location = data
        consolidatedWeather = location.getConsolidateWeather()
        setupView()
        collectionView.reloadData()
    }
    
    func didFailWithError(error: Error) {
        showSimpleAlert()
    }
    
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Error!", message: "There was an error, try again.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - Collection View Delegate
extension LocationDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return consolidatedWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let locationDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.locationDetailCellIdentifier.rawValue, for: indexPath as IndexPath) as? LocationDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        locationDetailCell.setupView(data: consolidatedWeather[indexPath.row])
        return locationDetailCell
    }
}

//MARK: - Identifier
extension LocationDetailViewController {
    enum Identifier: String {
        case locationDetailCellIdentifier = "locationDetailCellIdentifier"
    }
}
