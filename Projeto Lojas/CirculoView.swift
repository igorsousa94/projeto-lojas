//
//  CirculoView.swift
//  Projeto Lojas
//
//  Created by developer on 31/08/21.
//

import UIKit

class CirculoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initComum()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initComum()
    }
    
    func initComum(){
        self.layer.cornerRadius = 6
        //botao redondo
        //self.layer.cornerRadius =
            //self.frame.height/2
    }

}
