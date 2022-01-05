import Foundation

protocol LocationDelegate {
    func didUpdateLocation(data: LocationResponse)
    func didFailWithError(error: Error)
    func didUpdateImage(data: Data)
    func didUpdateImageFailWithError(error: Error)
}

extension LocationDelegate {
    func didUpdateLocation(data: LocationResponse) { }
    func didFailWithError(error: Error) { }
    func didUpdateImage(data: Data) { }
    func didUpdateImageFailWithError(error: Error) { }
}
