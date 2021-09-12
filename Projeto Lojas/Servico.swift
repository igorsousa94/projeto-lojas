//
//  Servico.swift
//  Projeto Lojas
//

import Foundation

//{
//    nome: "Ricardo Electro",
//    endereco: "Rua Ipatinga, 208",
//    servicos: [
//        {
//            titulo: "Troca de tela",
//            subtitulo: "iPhone",
//            valor: 1300.0,
//            imagem: "https://randomfox.ca/images/46.jpg"
//        },
//        {
//            titulo: "Troca de bateria",
//            subtitulo: "Samsung",
//            valor: 300.0
//        },
//        {
//            titulo: "Troca do plug de carregar",
//            subtitulo: "Samsung",
//            valor: 200.0
//        },
//        {
//            titulo: "Consertos em geral",
//            valor: 200.0
//        }
//    ]
//}

// struct
// Cópia por valor
// ou seja: A = B / b.nome = "oi" LOGO a.nome mantém o valor diferente de "oi"
// sem heranca
struct Servico: Codable {
    var titulo: String
    var subtitulo: String? // trocar pra detalhe
}

// class
// Cópia por referencia
// ou seja: A = B / b.nome = "oi" LOGO a.nome também é "oi"
// com heranca
class Pessoa {
    var nome: String?
    var subtitulo: String?
}
