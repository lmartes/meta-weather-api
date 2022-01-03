import UIKit

class LocationBackgroundView: UIView {
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var stateMessage: UILabel!
    
    private let nibName: String = "LocationBackgroundView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = self.loadViewFromNib() else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setupView(message: String) {
        stateMessage.text = message
    }
}
