//
//  CadastroViewController.swift
//  Projeto Lojas
//
//  Created by developer on 24/07/2021.
//

import UIKit

class CadastroViewController: UIViewController {
    @IBOutlet weak var botaoCadastrar: UIButton!
    @IBOutlet weak var fechar: UIImageView!
    

    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    @IBOutlet weak var campoTelefone: UITextField!
    @IBOutlet weak var campoIdade: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        botaoCadastrar.layer.cornerRadius = 10

    }
    
    @IBAction func executarCadastro(_ sender: Any) {
        //email ou senha invalido, monta msg erro
        var mensagemErro = "O campo "
        var formularioOk = false
        
        if let nomeUsuario = campoNome.text,
            nomeUsuario.isEmpty {
            mensagemErro += "nome "
        } else {
            if let emailUsuario = campoEmail.text,
                emailUsuario.isEmpty {
                mensagemErro += "email "
            } else {
                if let senhaUsuario = campoSenha.text,
                    senhaUsuario.isEmpty {
                    mensagemErro += "senha "
                } else {
                    if let telefoneUsuario = campoTelefone.text,
                        telefoneUsuario.isEmpty{
                        mensagemErro += "telefone "
                    } else {
                        if let idadeUsuario = campoIdade.text,
                            idadeUsuario.isEmpty{
                            mensagemErro += "idade "
                        } else {
                            formularioOk = true
                        }
                }
            }
        }
        }
        mensagemErro += "está vazio."
        
        if formularioOk {
            //apresenta msg erro
            //cria alerta de erro
            let alertaErro = UIAlertController(
                                    title: "Alerta",
                                    message: "Em desenvolvimento",
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
        } else {
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
    
    
    
}
