import UIKit
import AVFoundation
import QRCodeReader
import Alamofire
import MBProgressHUD
import KeychainSwift

class LoginViewController: UIViewController {


    @IBOutlet weak var txtUser: CapitalTextField!
    @IBOutlet weak var txtPassword: CapitalTextField!
    
    let keychain = KeychainSwift()
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        return QRCodeReaderViewController(builder: builder)
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keychain.clear()
        if let token = keychain.get("token"){
              print(token)
              self.performSegue(withIdentifier: "goToColection", sender: nil)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func scanQR(_ sender: CapitalButon) {
        
        readerVC.delegate = self
        
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            self.txtPassword.text = result?.value
        }
        
        readerVC.modalPresentationStyle = .formSheet
        present(readerVC, animated: true, completion: nil)
        
    }
    
    @IBAction func ingresarApp(_ sender: CapitalButon) {
        
        if txtUser.text == "" || txtPassword.text == ""{
            
            let actionSheetController: UIAlertController = UIAlertController(title: "Error", message: "Escribe tu usuario y/o contraseña!", preferredStyle: .alert)
            let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
                
            }
            actionSheetController.addAction(cancelAction)
            self.present(actionSheetController, animated: true, completion: nil)
            
        }else{
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            CapitalRequestManager.sendLogin(user: txtUser.text!, password: txtPassword.text!, completion: { (rs, msg, user)  in
                
                MBProgressHUD.hide(for: self.view, animated: true)
                if rs{
                    
                    self.keychain.set(user.id_user, forKey: "user")
                    self.keychain.set(user.token, forKey: "token")
                    
                    self.performSegue(withIdentifier: "goToColection", sender: nil)
                    
                    
                }else{
                    
                    let actionSheetController: UIAlertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
                    let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
                        
                    }
                    actionSheetController.addAction(cancelAction)
                    self.present(actionSheetController, animated: true, completion: nil)
                    
                    
                    
                }
                
                
            })
            
        }
    }
    
}

//MARK: - QRCodeReaderViewControllerDelegate

extension LoginViewController: QRCodeReaderViewControllerDelegate{
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        
        reader.stopScanning()
        dismiss(animated: true, completion: nil)
        
    }
    
}

