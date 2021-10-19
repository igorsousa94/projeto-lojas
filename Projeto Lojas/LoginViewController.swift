import UIKit
import Firebase
//import FirebaseAnalytics
//import Crashlytics

class LoginViewController: UIViewController {

    @IBOutlet weak var fundoLogoRedondo: UIView!
    @IBOutlet weak var botaoEntrar: UIButton!
    @IBOutlet weak var botaoCadastrar: UIButton!
    
    @IBOutlet weak var circle: UIView!
    
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var auth:Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        botaoCadastrar.layer.cornerRadius = 10
        botaoEntrar.layer.cornerRadius = 10
        circle.layer.cornerRadius = 15
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        fundoLogoRedondo.clipsToBounds = true
        fundoLogoRedondo.layer.cornerRadius =
            fundoLogoRedondo.frame.height / 2
        self.auth = Auth.auth();
        
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
    }
    
    func alert(titulo:String, mensagem:String){
        let alertController: UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel , handler: nil)
        alertController.addAction(ok);
        self.present(alertController, animated: true, completion: nil)
    }
    
    func navegar(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let perfilVC = storyBoard.instantiateViewController(withIdentifier: "PerfilViewController")
                let destinationVC = perfilVC as! PerfilViewController
                self.navigationController?.setViewControllers([destinationVC], animated: true)
                return
      }


    @IBAction func executarLogin(_ sender: Any) {
        let email: String = self.campoEmail.text ?? ""
        let senha: String = self.campoSenha.text ?? ""
        self.auth?.signIn(withEmail: email, password: senha, completion:{ (usuario,error) in
     
            if error != nil{
                self.alert(titulo: "Opa!", mensagem: "Erro ao efetuar login, favor conferir usuario ou senha.")
            }else{
              print(usuario)
                self.navegar()
            }
    })
    
}
}


