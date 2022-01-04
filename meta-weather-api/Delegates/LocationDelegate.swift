import Foundation

protocol LocationDelegate {
    func didUpdateLocation(data: LocationResponse)
    func didFailWithError(error: Error)
}
