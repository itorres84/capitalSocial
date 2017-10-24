import UIKit

class CollectionViewController: UIViewController {

    
    @IBOutlet weak var collectionViewPromo: UICollectionView!
    var promociones: [Promocion] = []
    var promo: Promocion!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewPromo.delegate = self
        loadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        prepareView()
        
    }
    
    func loadData(){
        
        let promo1 = Promocion(img: "LogoPapaJohns", title: "Papa Johns")
        let promo2 = Promocion(img: "PromoBenavides", title: "Farmacias Benavides")
        let promo3 = Promocion(img: "PromoBurguerKing", title: "Burguer King")
        let promo4 = Promocion(img: "PromoChilis", title: "Chilis")
        let promo5 = Promocion(img: "PromoCinepolis", title: "Cinepolis")
        let promo6 = Promocion(img: "PromoIdea", title: "Idea")
        let promo7 = Promocion(img: "PromoItaliannis", title: "Italiannis")
        let promo8 = Promocion(img: "PromoTizoncito", title: "Tizoncito")
        let promo9 = Promocion(img: "PromoWingstop", title: "Wingstop")
        let promo10 = Promocion(img: "PromoZonaFitness", title: "ZonaFitness")
        
        promociones.removeAll()
        promociones.append(promo1)
        promociones.append(promo2)
        promociones.append(promo3)
        promociones.append(promo4)
        promociones.append(promo5)
        promociones.append(promo6)
        promociones.append(promo7)
        promociones.append(promo8)
        promociones.append(promo9)
        promociones.append(promo10)
        
    }
    
    func prepareView(){
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "IconoMenu"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(menuButtonTapped))
        
        self.navigationItem.leftBarButtonItem = barButtonItem
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Mapa", style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    @objc func menuButtonTapped(sender: UIBarButtonItem) {
        print("Menu!!!!")
    
    }

    @objc func addTapped(sender: UIBarButtonItem) {
        
        print("go to mapa")
        self.performSegue(withIdentifier: "goToMap", sender: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDetail" {
            let nextScene = segue.destination as! DetailViewController
            nextScene.promo = self.promo
        }
        
        
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promociones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.lblTitlePromo.text = promociones[indexPath.row].title
        
        //cell.imgPromo.image
        cell.imgPromo.image = UIImage(named: promociones[indexPath.row].img)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            self.promo = promociones[indexPath.row]
            performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellSize: CGSize
        let collectionViewWidth = collectionView.bounds.size.width
        
        cellSize = CGSize(width: (collectionViewWidth * 0.49), height: (collectionViewWidth * 0.49))
        
        return cellSize
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
}
