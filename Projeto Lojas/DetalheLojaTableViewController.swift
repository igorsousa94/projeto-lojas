//
//  DetalheLojaTableViewController.swift
//  Projeto Lojas
//
//  Created by developer on 30/08/21.
//

import UIKit

class DetalheLojaTableViewController: UITableViewController {

    @IBOutlet var header: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 251
    }

}
