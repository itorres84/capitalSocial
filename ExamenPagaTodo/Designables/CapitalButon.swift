import UIKit

@IBDesignable class CapitalButon: UIButton {

    @IBInspectable var typeColor: Int = 0 {
        didSet {
            switch typeColor {
            case 1:
               backgroundColor = DefaultColors.primaryColor
            case 2:
                backgroundColor = DefaultColors.secondaryColor
            case 3:
                backgroundColor = DefaultColors.terciaryColor
            default:
                backgroundColor = DefaultColors.textColor
            }
        }
    }
    
    @IBInspectable var typeFont: Int = 0 {
        didSet {
            switch typeFont {
            case 1:
                self.titleLabel?.font = DefaultFont.robotoBold
            case 2:
                self.titleLabel?.font = DefaultFont.robotoLight
            case 3:
                self.titleLabel?.font = DefaultFont.robotoMedium
            default:
                self.titleLabel?.font = DefaultFont.robotoRegular
            }
        }
    }
    
    @IBInspectable var typeBorder: Int = 0 {
        didSet {
            switch typeBorder {
            case 1:
                self.layer.borderColor = DefaultColors.primaryColor.cgColor
                self.layer.borderWidth = 2
            case 2:
                self.layer.borderColor = DefaultColors.secondaryColor.cgColor
                self.layer.borderWidth = 2
            case 3:
                self.layer.borderColor = DefaultColors.terciaryColor.cgColor
                self.layer.borderWidth = 2
            default:
                self.layer.borderWidth = 2
                self.layer.borderColor = DefaultColors.textColor.cgColor
            }
        }
    }

}
