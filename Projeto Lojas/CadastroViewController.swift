//
//  CadastroViewController.swift
//  Projeto Lojas
//
//  Created by developer on 24/07/2021.
//

import UIKit
import Firebase


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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        botaoCadastrar.layer.cornerRadius = 10
        campoTelefone.delegate = self
        campoIdade.delegate = self
        self.auth = Auth.auth();
    }
    
 
    @IBAction func executarCadastro(_ sender: Any) {
        let email: String = self.campoEmail.text ?? ""
        let senha: String = self.campoSenha.text ?? ""
        self.auth?.createUser(withEmail: email, password: senha, completion: {
            (result,error ) in
            
            if error != nil {
                print("DEU MERDAA!!!!!!")
            }else{
                print("VOAMOOOOOOOSSS")
                print(result)
            }
        })
    }
    
  
    
    //
    @IBAction func fecharCadastro() {
        self.dismiss(animated: true)
    }
    
}

