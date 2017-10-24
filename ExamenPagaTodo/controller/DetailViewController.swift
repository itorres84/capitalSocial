import UIKit

class DetailViewController: UIViewController {

    var promo: Promocion!
    
    @IBOutlet weak var imgPromo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textViewDes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(promo.title)
        imgPromo.image = UIImage(named: promo.img)
        lblTitle.font = DefaultFont.robotoBold
        lblTitle.text = promo.title
        
        textViewDes.font = DefaultFont.robotoMedium
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        prepareView()
    }
    
    func prepareView(){
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "IconoBack"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(menuButtonTapped))
        
        self.navigationItem.leftBarButtonItem = barButtonItem
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let barButtonItemRigth = UIBarButtonItem(image: UIImage(named: "Icono_compartir"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(addTapped))
        
        self.navigationItem.rightBarButtonItem = barButtonItemRigth
        
    }
    
    @objc func menuButtonTapped(sender: UIBarButtonItem) {
            
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
        
        let activity = UIActivityViewController(activityItems: [imgPromo,lblTitle,textViewDes], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = self.view
        
        self.present(activity, animated: true, completion: nil)
        
    }
    
}
