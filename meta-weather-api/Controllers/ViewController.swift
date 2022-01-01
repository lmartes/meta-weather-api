import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }

    private func setDelegates() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//MARK: - Search Bar Delegate
extension ViewController: UISearchBarDelegate {
    
}

//MARK: - Table View Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let locationCell = tableView.dequeueReusableCell(withIdentifier: "locationCellIdentifier") else {
            return UITableViewCell()
        }
        
        return locationCell
    }
    
    
}



