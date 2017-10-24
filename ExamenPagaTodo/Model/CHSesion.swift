import UIKit

class CHSesion: NSObject {

    var agente: String!
    var error: String!
    var id_user: String!
    var token: String!
    
    override init() {
    }
    
    init(agente: String, error: String, id_user: String, token: String) {
    
        self.agente = agente
        self.error = error
        self.id_user = id_user
        self.token = token
        
    }
    
}
