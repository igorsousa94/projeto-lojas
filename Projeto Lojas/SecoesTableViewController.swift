//
//  SecoesTableViewController.swift
//  Projeto Lojas
//
//  Created by Marcelo César Dolácio on 11/07/21.
//

import UIKit

class SecoesTableViewController: UITableViewController {

    @IBOutlet weak var secao1: UITableViewCell!
    @IBOutlet weak var Secao2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        secao1.layer.cornerRadius = 20;
        secao1.layoutMargins.left = 5;
        secao1.layoutMargins.right = 5;
        secao1.layoutMargins.bottom = 5;
        secao1.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        Secao2.layer.cornerRadius = 20;
        Secao2.layoutMargins.left = 5;
        Secao2.layoutMargins.right = 5;
        Secao2.layoutMargins.bottom = 5;
        Secao2.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
    }

    

}
