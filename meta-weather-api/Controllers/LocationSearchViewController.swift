import UIKit

class LocationSearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationBackgroundView: LocationBackgroundView!
    
    private var locationSearchManager: LocationSearchManager = LocationSearchManager()
    private var locationsSearch: [LocationSearchResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupView()
    }

    private func setDelegates() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        locationSearchManager.delegate = self
    }
    
    private func setupView() {
        showLocationBackground(with: "Here we go... Find a location")
    }
    
    private func showLocationBackground(with message: String) {
        locationBackgroundView.isHidden = false
        locationBackgroundView.setupView(message: message)
        tableView.backgroundView = locationBackgroundView
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToLocationDetail" else {
            return
        }
        
        guard let locationDetailViewController = segue.destination as? LocationDetailViewController else {
            return
        }
        
        guard let sender = sender as? LocationSearchResponse else {
            return
        }
        
        locationDetailViewController.locationSearchResponse = sender
    }
}

//MARK: - Location Search Delegate
extension LocationSearchViewController: LocationSearchDelegate {
    func didUpdateLocationSearch(data: [LocationSearchResponse]) {
        if data.isEmpty {
            locationsSearch = []
            showLocationBackground(with: "No locations found")
            return
        }
        
        locationsSearch = data
        tableView.reloadData()
    }
    
    func didFailWithError(error: Error) {
        locationsSearch = []
        showLocationBackground(with: "Location search is not valid.")
    }
}

//MARK: - Search Bar Delegate
extension LocationSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        locationBackgroundView.isHidden = true
        if searchText.isEmpty {
            locationsSearch = []
            showLocationBackground(with: "Try again... Find a location")
            return
        }
        
        locationSearchManager.searchLocation(location: searchText)
    }
}

//MARK: - Table View Delegate
extension LocationSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let locationCell = tableView.dequeueReusableCell(withIdentifier: LocationSearchTableViewCell().identifier) as? LocationSearchTableViewCell else {
            return UITableViewCell()
        }
        locationCell.setupView(data: locationsSearch[indexPath.row])
        return locationCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: LocationDetailViewController().segueIdentifier, sender: locationsSearch[indexPath.row])
    }
    
    //TODO: - Create enum to add identifier
}
