import UIKit

class LocationDetailViewController: UIViewController {
    let segueIdentifier: String = "goToLocationDetail"
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var parentTitle: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var locationSearchResponse: LocationSearchResponse = LocationSearchResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupView()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupView() {
        locationTitle.text = locationSearchResponse.getTitle()
    }

}

//MARK: - Collection View Delegate
extension LocationDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
