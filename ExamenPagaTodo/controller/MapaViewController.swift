import UIKit
import MapKit

class MapaViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation()
        addNotation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Capital Social", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
        
         _ = navigationController?.popViewController(animated: true)
        
    }
    
    func centerMapOnLocation() {
        
        map.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func addNotation(){
        
        let artwork = Artwork(title: "Punto pedido!!",
                              locationName: "No se donde es",
                              discipline: "ha caray!!",
                              coordinate: CLLocationCoordinate2D(latitude: 19.4141, longitude: -99.1799))
        map.addAnnotation(artwork)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
extension MapaViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { currentLocation = locations.last }
        
        if currentLocation == nil {
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2000, 2000)
                map.setRegion(viewRegion, animated: false)
            }
        }
    }
    
}
