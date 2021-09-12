//
//  ProdutoTableViewCell.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 04/08/21.
//

import UIKit

class ProdutoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemDoProduto: UIImageView!
    @IBOutlet weak var tituloDoProduto: UILabel!
    @IBOutlet weak var subTituloDoProduto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(_ titulo: String, _ subTitulo: String) {
        self.tituloDoProduto.text = titulo
        self.subTituloDoProduto.text = subTitulo
    }
    
    func configure(_ elemento: Servico) {
        self.tituloDoProduto.text = elemento.titulo
        self.subTituloDoProduto.text = elemento.subtitulo
    }

}
