import UIKit

class CapitalTextField: UITextField {

    @IBInspectable var typeBorderColor: Int = 0 {
        didSet {
            switch typeBorderColor {
            case 1:
                self.layer.borderColor = DefaultColors.primaryColor.cgColor
            case 2:
                self.layer.borderColor = DefaultColors.secondaryColor.cgColor
            case 3:
                self.layer.borderColor = DefaultColors.terciaryColor.cgColor
            default:
                self.layer.borderColor = DefaultColors.textColor.cgColor
            }
        }
    }


}
