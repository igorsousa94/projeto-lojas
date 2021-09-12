//
//  DetalheLojaTableViewController.swift
//  Projeto Lojas
//


import UIKit

class DetalheLojaTableViewController: UITableViewController {

    @IBOutlet var header: UIView!
    var idLoja: String?

    let servicos = [
            Servico(titulo: "Troca de tela", subtitulo: "iPhone"),
            Servico(titulo: "Troca de bateria", subtitulo: "Samsung"),
            Servico(titulo: "Troca do plug de carregar", subtitulo: "Samsung"),
            Servico(titulo: "Consertos em geral", subtitulo: nil)]

    override func viewDidLoad() {
        super.viewDidLoad()
        buscarLojasApi()
        print(idLoja)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Requisicao
    func buscarLojasApi() {
        let urlString = "https://projeto-lojas-tz4vp.ondigitalocean.app/api/lojas/\(idLoja ?? "")"
        guard let url = URL(string: urlString) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, urlResponse, erro in
            guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode,
                  statusCode == 200 && statusCode < 300,
                  let data = data else {
                //notificar
                return
            }

            // conversao de DATA -> Loja
            let decoder = JSONDecoder()
            // nao eh loja1 Crie a classe detalhe da loja
            // remover esse comentario
            let listaDeDetalheLojasServidor = try?
                decoder.decode([Loja1].self, from: data)
            let detalheLoja = listaDeDetalheLojasServidor?.first
//            self.servicos = detalheLoja.servicos ?? []

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        task.resume()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "celulaLojas"

        let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        if let cell = cell as? ProdutoTableViewCell {
            let elementoAtual = servicos[indexPath.row]
            cell.configure(elementoAtual)
        }
        return cell
    }


    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 251
    }
}
