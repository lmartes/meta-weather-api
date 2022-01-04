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
        time.text = location.getTitle()
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
        setupView()
    }
    
    func didFailWithError(error: Error) {
        print("hubo un error: ", error)
    }
}

//MARK: - Collection View Delegate
extension LocationDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return location.getConsolidateWeather().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
