import UIKit
import Firebase
//import FirebaseAnalytics
//import Crashlytics


class CadastroViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var botaoCadastrar: UIButton!
    @IBOutlet weak var fechar: UIImageView!
    
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    @IBOutlet weak var campoTelefone: UITextField!
    @IBOutlet weak var campoIdade: UITextField!
    
    var formularioOk = false
    var msgRetornoAPI = " "
    var auth:Auth?
    
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
        // Do any additional setup after loading the view.
        botaoCadastrar.layer.cornerRadius = 10
        campoTelefone.delegate = self
        campoIdade.delegate = self
        self.auth = Auth.auth();
    }
    
    func alert(titulo:String, mensagem:String){
          let alertController: UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
          let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel , handler: nil)
          alertController.addAction(ok);
          self.present(alertController, animated: true, completion: nil)
      }
    
    @IBAction func executarCadastro(_ sender: Any) {
        let email: String = self.campoEmail.text ?? ""
        let senha: String = self.campoSenha.text ?? ""
        if (self.campoSenha.text == "" || self.campoEmail.text  == "" || self.campoNome.text  == "" || self.campoIdade.text  == "" || self.campoTelefone.text == ""){
            self.alert(titulo: "Opa!", mensagem: "É necessário preencher todos os campos")
        }else{
            self.auth?.createUser(withEmail: email, password: senha, completion: {
                (result,error ) in
                
                if error != nil {
                    self.alert(titulo: "Opa!", mensagem: "Erro ao cadastrar, favor conferir todos os campos")
                }else{
                    self.alert(titulo: "Eba", mensagem: "Cadastro efetuado com sucesso!")
                    print("VOAMOOOOOOOSSS")
                    print(result)
                }
            })
        }
    
    }
    
  
    
    //
    @IBAction func fecharCadastro() {
        self.dismiss(animated: true)
    }
    
}

