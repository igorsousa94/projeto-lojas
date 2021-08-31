//
//  DetalheMinhaListaTableViewController.swift
//  Projeto Lojas
//
//  Created by developer on 26/08/21.
//

import UIKit

class DetalheMinhaListaTableViewController: UITableViewController {

    @IBOutlet weak var logoDaLoja: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoDaLoja.layer.cornerRadius = 6
    }

}
