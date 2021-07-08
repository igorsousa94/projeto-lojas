//
//  LoginViewController.swift
//  Projeto Lojas
//
//  Created by developer on 06/07/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fundoLogoRedondo: UIView!
    @IBOutlet weak var botaoEntrar: UIButton!
    @IBOutlet weak var botaoCadastrar: UIButton!
    
    
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        botaoCadastrar.layer.cornerRadius = 10
        botaoEntrar.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        fundoLogoRedondo.clipsToBounds = true
        fundoLogoRedondo.layer.cornerRadius =
            fundoLogoRedondo.frame.height / 2
    }

    @IBAction func executarLogin(_ sender: Any) {
        
        //valida email e senha e executa proxima tela
        if let emailUsuario = campoEmail.text,
           !emailUsuario.isEmpty,
           let senhaUsuario = campoSenha.text,
           !senhaUsuario.isEmpty {
            //navegar proxima tela
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let perfilVC = storyBoard.instantiateViewController(withIdentifier: "PerfilViewControllerID")
            self.navigationController?.setViewControllers([perfilVC], animated: true)
            return
        }
        
        //email ou senha invalido, monta msg erro
        var mensagemErro = "O campo "
        if let emailUsuario = campoEmail.text,
           !emailUsuario.isEmpty {
            mensagemErro += "senha "
        } else {
            if let senhaUsuario = campoSenha.text,
                !senhaUsuario.isEmpty {
                mensagemErro += "email "
            } else {
                mensagemErro += "email e senha "
            }
        }
        mensagemErro += "está vazio."
        
        
        //apresenta msg erro
        //cria alerta de erro
        let alertaErro = UIAlertController(
                                title: "Erro",
                                message: mensagemErro,
                                preferredStyle: .alert
        )
        //cria acao para alerta do erro
        let acaoOk = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        
        //add acao no alerta
        alertaErro.addAction(acaoOk)
        
        //apresenta alerta
        present(
            alertaErro,
            animated: true,
            completion: nil
        )
    }
    
}
