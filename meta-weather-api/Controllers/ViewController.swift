import UIKit

class ViewController: UIViewController, LocationSearchDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var locationSearchManager: LocationSearchManager = LocationSearchManager()
    private var locationsSearch: [LocationSearchResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }

    private func setDelegates() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        locationSearchManager.delegate = self
    }
    
    func didUpdateLocationSearch(data: [LocationSearchResponse]) {
        locationsSearch = data
        tableView.reloadData()
    }
    
    func didFailWithError(error: Error) {
        //TODO: Add Modal "Location search is not valid."
        print("didFailWithError Error: \(error)")
    }

}

//MARK: - Search Bar Delegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        locationSearchManager.searchLocation(location: searchText)
    }
}

//MARK: - Table View Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let locationCell = tableView.dequeueReusableCell(withIdentifier: "locationCellIdentifier") as? LocationTableViewCell else {
            return UITableViewCell()
        }
        locationCell.setupView(data: locationsSearch[indexPath.row])
        return locationCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected: ", indexPath.row)
    }
    
}



