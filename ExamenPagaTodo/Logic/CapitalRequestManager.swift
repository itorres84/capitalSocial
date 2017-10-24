import UIKit
import Alamofire
import SwiftyJSON

class CapitalRequestManager: NSObject {
    
    private static var Manager: Alamofire.SessionManager = {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            
            "agentemovil.pagatodo.com": .disableEvaluation
        ]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return manager
    }()
    
    //Login
    static func sendLogin(user:String , password:String, completion: @escaping (_ result:Bool, _ message:String, _ user: CHSesion) -> Void) {
    
        let sesion: CHSesion = CHSesion()
        let urlString = "https://agentemovil.pagatodo.com/AgenteMovil.svc/agMov/login"
        
        let data = ["pass": password, "user": user]
        let parameters: [String: AnyObject] = ["data": data as AnyObject]
        
        let headers: HTTPHeaders = [
            "SO": "iOS",
            "Version": "1.0.3",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        CapitalRequestManager.Manager.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            debugPrint(response)
            
            if response.result.error != nil {
                
                
                
            } else { //no errors
                let statusCode = (response.response?.statusCode)!
                
                if statusCode == 200{
                   
                    let rs = JSON(response.data!)
                    if let error = rs["error"].dictionary{
                        
                        completion(false, (error["message"]?.stringValue)!, sesion)
                    
                    }else{
                        
                        sesion.agente = rs["agente"] != JSON.null ? rs["agente"].stringValue : ""
                        
                        sesion.id_user = rs["id_user"] != JSON.null ? rs["id_user"].stringValue : ""
                        
                        sesion.token = rs["token"] != JSON.null ? rs["token"].stringValue : ""
                        
                        completion(true, "", sesion)
                        
                    }
                }else{
                    
                    completion(false, "Ocurrio un error en el servicio", sesion)
                    
                }
                
            }
        }
        
        
    }
    
        
    
    }
    
    
    
    

