//
//  PerfilViewController.swift
//  Projeto Lojas
//
//  Created by developer on 08/07/21.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var quadradoBranco: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        quadradoBranco.layer.cornerRadius = 10
    }  
}
