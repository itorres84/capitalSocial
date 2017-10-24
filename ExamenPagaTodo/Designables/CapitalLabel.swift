import UIKit

@IBDesignable class CapitalLabel: UILabel {

    @IBInspectable var typeFont: Int = 0 {
        didSet {
            switch typeFont {
            case 1:
                self.font = DefaultFont.robotoBold
            case 2:
                self.font = DefaultFont.robotoLight
            case 3:
                self.font = DefaultFont.robotoMedium
            default:
                self.font = DefaultFont.robotoRegular
            }
        }
    }
    
    @IBInspectable var isUnderLine: Bool = false {
        didSet {
            if isUnderLine{
                let text = self.text
                let textRange = NSMakeRange(0, (text?.characters.count)!)
                let attributedText = NSMutableAttributedString(string: text!)
                attributedText.addAttribute(NSAttributedStringKey.underlineStyle , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
                self.attributedText = attributedText
                
            }
        }
    }
    
    
    

}
