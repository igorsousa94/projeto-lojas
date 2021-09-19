//
//  LoginViewController.swift
//  Projeto Lojas
//
//  Created by developer on 06/07/21.
//

import UIKit
import Firebase
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
                print("LOGIN MOLHOU")
            }else{
              print("LOGIN DEU BOOOOMMM")
              print(usuario)
                self.navegar()
             // self.navigationController?.setViewControllers(PerfilViewController, animated: true)
            // self.present(PerfilViewController, animated: true, completion:nil)
              
            }
    })
    
}
}

