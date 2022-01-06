import Foundation

extension String {
    func format(with: String, outFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = with
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: self) else {
            print("Extension + String Error: Date could not be formatted")
            return self
        }
        dateFormatter.dateFormat = outFormat
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
