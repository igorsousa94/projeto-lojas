import UIKit
//import FirebaseAnalytics
//import Crashlytics

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var telefone: UILabel!
    @IBOutlet weak var quadradoBranco: UIView!
    
//Evento analytics e evento Crashlytics
//    override func viewDidAppear() {
//        @IBAction func registrarEventoAnalytics(_sender: Any){
//            Analytics.logEvent("clique_botao", parameters: [
//                "uuidDevice": idenificadorUnicoCelular,
//                AnalyticsParameterItemID:"Botao Tela Inicial"])
//        }
//        @IBAction func crashApp(_sender: Any){
//        Crashlytics.sharedInstance().crash()
//    }
//        super.viewDidAppear()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}
