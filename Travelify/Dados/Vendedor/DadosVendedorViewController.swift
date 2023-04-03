//
//  DadosVendedorViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class DadosVendedorViewController: UIViewController {
    
    private var customView: DadosVendedorScreenView? = nil
    private var celulas: [DadosVendedorScreenViewCell]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraTableView()
    }
    
    func buildView() {
        view = DadosVendedorScreenView()
        customView = view as? DadosVendedorScreenView
    }
    
    func configuraTableView() {
        customView?.tableView.register(DadosVendedorScreenViewCell.self, forCellReuseIdentifier: "DadosDoVendedorCell")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
    
    func sairDoApp() {
        if let telaAnterior = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) {
            navigationController?.popToViewController(telaAnterior, animated: true)
        }
    }
}

extension DadosVendedorViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "DadosDoVendedorCell", for: indexPath) as? DadosVendedorScreenViewCell else {
            fatalError("error to create ViagemTableViewCell")
        }

        switch indexPath.row {
        case 0:
            celula.configuraInfo(icon: "folder.badge.person.crop", info: "Seus dados")
        case 1:
            celula.configuraInfo(icon: "bag.circle", info: "Suas vendas")
        case 2:
            celula.configuraInfo(icon: "message.circle", info: "Suas mensagens")
        case 3:
            celula.configuraInfo(icon: "return.left", info: "Sair")
        default:
            break
        }
        
        return celula
        
    }
}

extension DadosVendedorViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = PerfilUsuarioController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = VendasViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = MensagensVendedorViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            sairDoApp()
        default:
            break
        }
    }
    
}

