//
//  LojaTableViewCell.swift
//  Projeto Lojas
//
//

import UIKit

class LojaTableViewCell: UITableViewCell {
    @IBOutlet weak var logoLoja: UIImageView?
    @IBOutlet weak var nomeLoja: UILabel!
    @IBOutlet weak var tipoLojaVideoGame: UIImageView?
    @IBOutlet weak var tipoLojaNotebook: UIImageView?
    
    func configure(_ loja: Loja1) {
        if let logoUrlString = loja.logo,
           let logoUrl = URL(string: logoUrlString),
           let dadosDaLogo = try? Data(contentsOf: logoUrl) {

            self.logoLoja?.image = UIImage(data: dadosDaLogo)
        } else {
            self.logoLoja?.isHidden = true
        }
        self.nomeLoja.text = loja.nome
        
        self.tipoLojaNotebook?.isHidden = !(loja.tipoDaLoja.computador ?? false)
        self.tipoLojaVideoGame?.isHidden = !(loja.tipoDaLoja.videogame ?? false)
        

    }

}
