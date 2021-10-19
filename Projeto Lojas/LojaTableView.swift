import UIKit
import Kingfisher

class LojaTableViewCell: UITableViewCell {
    @IBOutlet weak var logoLoja: UIImageView?
    @IBOutlet weak var nomeLoja: UILabel!
    @IBOutlet weak var tipoLojaVideoGame: UIImageView?
    @IBOutlet weak var tipoLojaNotebook: UIImageView?
    
    func configure(_ loja: Loja1) {
        if let logoUrlString = loja.logo,
           !logoUrlString.isEmpty,
           let logoUrl = URL(string: logoUrlString) {
            self.logoLoja?.kf.setImage(with: logoUrl)
        } else {
            self.logoLoja?.isHidden = true
        }
        
        self.nomeLoja.text = loja.nome
        self.tipoLojaNotebook?.isHidden = !(loja.tipoDaLoja.computador ?? false)
        self.tipoLojaVideoGame?.isHidden = !(loja.tipoDaLoja.videogame ?? false)
    }

}
