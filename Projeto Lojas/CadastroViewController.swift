//
//  CadastroViewController.swift
//  Projeto Lojas
//
//  Created by developer on 24/07/2021.
//

import UIKit

// API Cadastro : https://projeto-lojas-tz4vp.ondigitalocean.app/api/usuario/cadastrar
struct structCadastro: Codable {
    let email: String
    let senha: String
    let nome: String
    let idade: Int
    let telefone: String
}

struct structRetornoErro: Codable {
    let mensagem: String
    let erro: String
}

struct structRetornoOK: Codable {
    let _id: String
    let email: String
    let senha: String
    let nome: String
    let idade: Int
    let telefone: String
    let __v: Int
}


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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        botaoCadastrar.layer.cornerRadius = 10
        campoTelefone.delegate = self
        campoIdade.delegate = self
    }
    
    //MARK:- UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let permitirCaracteresSet = CharacterSet.decimalDigits
        let tipoCaracteres = CharacterSet(charactersIn: string)
        return permitirCaracteresSet.isSuperset(of: tipoCaracteres)
    }
    
    @IBAction func executarCadastro(_ sender: Any) {
        //monta msg erro
        var mensagemErro = "O campo "
        let nomeUsuario: String? = campoNome.text
        let emailUsuario: String? = campoEmail.text
        let senhaUsuario: String? = campoSenha.text
        let telefoneUsuario: String? = campoTelefone.text
        let idadeUsuario: String? = campoIdade.text
        
        if (nomeUsuario == "") {
            mensagemErro += "nome "
        } else {
            if emailUsuario == "" {
                mensagemErro += "email "
            } else {
                if senhaUsuario == "" {
                    mensagemErro += "senha "
                } else {
                    if telefoneUsuario == "" {
                        mensagemErro += "telefone "
                    } else {
                        if idadeUsuario == "" {
                            mensagemErro += "idade "
                        } else {
                            formularioOk = true
                        }
                    }
                }
            }
        }
        mensagemErro += "é obrigatório."
        
        if formularioOk {
            cadastroUsuarioApi(nomeUsuario, emailUsuario, senhaUsuario, telefoneUsuario, idadeUsuario)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
                print("msgRetornoAPI >>>>>>> ", self.msgRetornoAPI)
     
                var titulo: String
                if self.msgRetornoAPI == "Usuário Cadastrado com Sucesso!" {
                    titulo = "Parabéns"
                } else { titulo = "Alerta" }
                
                let alerta = UIAlertController(
                    title: titulo,
                    message: self.msgRetornoAPI,
                    preferredStyle: .alert
                )
                
                //cria acao para alerta do erro
                let acaoOk = UIAlertAction(
                    title: "OK",
                    style: UIAlertAction.Style.default,
                    handler: nil
                )
                
                //add acao no alerta
                alerta.addAction(acaoOk)
                
                //apresenta alerta
                self.present(
                    alerta,
                    animated: true,
                    completion: nil
                )
               
            }
        } else {
            //apresenta msg erro
            //cria alerta de erro
            let alertaErro = UIAlertController(
                title: "Alerta",
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
    
    //    func cadastroUsuarioApi (_ nome: String, _ email: String, _ senha: String, _ idade: String, _ telefone: String) {
    func cadastroUsuarioApi (_ nome: String?, _ email: String?, _ senha: String?, _ telefone: String?, _ idade: String?) {
        let urlString = "https://projeto-lojas-tz4vp.ondigitalocean.app/api/usuario/cadastrar"
        var msgRetorno = " "
        
        guard let url = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: url)
        
        print(" Passo 1 ", nome, email)
        
        let json: [String: Any] = [
            "email": email,
            "senha": senha,
            "nome": nome,
            "idade": idade,
            "telefone": telefone
        ] as Dictionary
        
        print(" Passo 2 ")
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [])
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.timeoutInterval = 30
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(" Passo 3 ")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error)
            in
            print(" Passo 3.1 ")
            guard let responseData = data else { return }
            print(" Passo 4 ")

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  statusCode == 200 && statusCode < 300,
                  let data = data else {       //alerta de erro
                do {
                    let retornoErro = try JSONDecoder().decode(structRetornoErro.self, from: responseData)
                    msgRetorno = String(retornoErro.mensagem)
                    self.msgRetornoAPI = msgRetorno
                    print("mensagemRetornoErro", msgRetorno)
                } catch {
                    print("error4: \(error)")
                }
                return
            }
            
            print(" Passo 5 ")

            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                do {
                    let retornoOk = try JSONDecoder().decode(structRetornoOK.self, from: responseData)
                    msgRetorno = String("Usuário Cadastrado com Sucesso!")
                    self.msgRetornoAPI = msgRetorno
                    print("retornoOk._id: ", retornoOk._id)
                    return
                } catch {
                    print("error: \(error)")
                }
                print("=========", responseJSON)
            }
        }
        task.resume()
    }
    
    
    //
    @IBAction func fecharCadastro() {
        self.dismiss(animated: true)
    }
    
}
