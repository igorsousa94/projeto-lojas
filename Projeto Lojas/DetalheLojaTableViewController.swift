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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identify = "celulaLojasCopia"
        if indexPath.row % 2 == 0 {
            identify = "celulaLojas"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 251
    }

}
