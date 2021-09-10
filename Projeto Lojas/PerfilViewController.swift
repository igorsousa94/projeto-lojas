//
//  PerfilViewController.swift
//  Projeto Lojas
//
//  Created by developer on 08/07/21.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var telefone: UILabel!
    @IBOutlet weak var quadradoBranco: UIView!
    var teste:Usuario? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var mainViewController:LoginViewController?
               print("CHEGUEI NA TELA DE PERFIL")
               print(self.teste)
               print(self.teste?.nome)

        self.nome.text = self.teste?.nome
        self.email.text = self.teste?.email
        self.telefone.text = self.teste?.telefone
    }  
}
