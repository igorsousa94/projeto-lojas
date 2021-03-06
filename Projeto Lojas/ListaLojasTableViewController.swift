import UIKit
import NVActivityIndicatorView
//import FirebaseAnalytics
//import Crashlytics

class ListaLojasTableViewController: UITableViewController {
    var listaDeLojas:[Loja1] = []
    var idCelulaClicada: String?
    var loading: NVActivityIndicatorView?
    
    //Evento analytics e evento Crashlytics
    //    override func viewDidAppear() {
    //        @IBAction func registrarEventoAnalytics(_sender: Any){
    //            Analytics.logEvent("clique_botao", parameters: [
    //                "uuidDevice": idenificadorUnicoCelular,
    //                AnalyticsParameterItemID:"Botao Tela Inicial"])
    //        }
    //        @IBAction func crashApp(_sender: Any){
    //        Crashlytics.sharedInstance().crash()
    //    }
    //        super.viewDidAppear()
    //    }
    
    // MARK: - Ciclo de vida da View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buscarLojasApi()
    }
    
    // MARK: - Requisicao
    func buscarLojasApi() {
        let urlString = "https://projeto-lojas-tz4vp.ondigitalocean.app/api/lojas/"
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //loading
        loading = NVActivityIndicatorView(
            frame: self.tableView.frame,
            type: NVActivityIndicatorType.circleStrokeSpin,
            color: .red,
            padding: 100)
        loading?.startAnimating()
        self.tableView.addSubview(loading ?? UIView(frame: .zero))
        let task = URLSession.shared.dataTask(with: request) { data, urlResponse, erro in
            guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode,
                  statusCode == 200 && statusCode < 300,
                  let data = data else {
                DispatchQueue.main.async {
                    self.loading?.stopAnimating()
                }
                return
            }
            
            let decoder = JSONDecoder()
            let listaDeLojasServidor = try? decoder.decode([Loja1].self, from: data)
            
            self.listaDeLojas = listaDeLojasServidor ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.loading?.stopAnimating()
            }
        }
        task.resume()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeLojas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "celulaLojaIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        guard let celulaLoja = cell as? LojaTableViewCell else {
            return cell
        }

        let lojaAtual = listaDeLojas[indexPath.row]
        celulaLoja.configure(lojaAtual)

        return celulaLoja
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalhe = segue.destination as? DetalheLojaTableViewController,
           let indexPathSelecionado = tableView.indexPathForSelectedRow {
            detalhe.idLoja = listaDeLojas[indexPathSelecionado.row].id
        }
    }
}

struct Loja1: Codable {
    var id: String?
    var logo: String?
    var nome: String?
    var logobig: String?

    var tipoDaLoja: TipoLoja
    var servico: Servico?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case logo = "logoSquare"
        case nome
        case logobig
        case tipoDaLoja = "tipo"
        case servico
    }
}

struct TipoLoja: Codable {
    var computador: Bool?
    var videogame: Bool?
}
//{
//        "tipo": {
//            "computador": true,
//            "videogame": true
//        },
//        "_id": "6123268f698ba2a20d8e6bc9",
//        "nome": "Ricardo eletro",
//        "logoSquare": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvY4Rz-YdyrY62lI0ePjc5uOA9e7VCGcGnkA&usqp=CAU"
//    }
