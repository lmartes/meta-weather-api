import Foundation

protocol LocationSearchDelegate {
    func didUpdateLocationSearch(data: [LocationSearchResponse])
    func didFailWithError(error: Error)
}
