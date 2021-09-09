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
    
    @IBOutlet weak var circle: UIView!
    
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var retorno: Usuario? = nil;
    
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
    }
    
    func navegar(){
          let storyBoard = UIStoryboard(name: "Main", bundle: nil)
          let perfilVC = storyBoard.instantiateViewController(withIdentifier: "PerfilViewController")
          let destinationVC = perfilVC as! PerfilViewController
          destinationVC.teste = self.retorno
          self.navigationController?.setViewControllers([destinationVC], animated: true)
          return
      }


    @IBAction func executarLogin(_ sender: Any) {
        
        //valida email e senha e executa proxima tela
               if let emailUsuario = campoEmail.text,
                  !emailUsuario.isEmpty,
                  let senhaUsuario = campoSenha.text,
                  !senhaUsuario.isEmpty {
                  
                   let urlEndPoint = "https://projeto-lojas-tz4vp.ondigitalocean.app/api/usuario/login"
                          guard let url = URL(string: urlEndPoint) else {
                            return
                          }
                         
                          var request = URLRequest(url: url)
                          request.httpMethod = "POST"
                          let usuario = Usuario(email: campoEmail.text, senha: campoSenha.text)
                          let encoder = JSONEncoder()
                          let usuarioData =  try? encoder.encode(usuario)
                          request.setValue("application/json", forHTTPHeaderField: "Content-type")
                          request.httpBody = usuarioData
                         
                         let task = URLSession.shared.dataTask(with: request){ data, urlResponse, erro in
                             guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode,
                                   statusCode == 200 && statusCode < 300,
                                  
                             let data = data else{
                                 return
                             }
                           print("AQUIIII")
                           let decoder = JSONDecoder()
                           let usuario =  try? decoder.decode(Usuario.self, from: data)
                           let str = String(decoding: data, as: UTF8.self)
                           self.retorno = usuario;
                           print("BODY \n \(str)")
                           print("BODY \n \(self.retorno)")
                           DispatchQueue.main.async {
                               self.navegar()
                           }
                         
               
                           
                         }
                         
                   task.resume()
                  
                  
               }
    }
    
}
struct Usuario: Codable {
        var email: String?
        var senha: String?
        var telefone: String?
        var nome: String?
        
}
