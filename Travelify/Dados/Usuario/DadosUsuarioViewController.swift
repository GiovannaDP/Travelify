//
//  DadosUsuarioViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class DadosUsuarioViewController: UIViewController {
    
    private var customView: DadosUsuarioScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraTableView()
    }
    
    func buildView() {
        view = DadosUsuarioScreenView()
        customView = view as? DadosUsuarioScreenView
    }
    
    func configuraTableView() {
        customView?.tableView.register(DadosUsuarioScreenViewCell.self, forCellReuseIdentifier: "DadosDoUsuarioCell")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
    
    func sairDoApp() {
        if let telaAnterior = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) {
            navigationController?.popToViewController(telaAnterior, animated: true)
        }
    }
}

extension DadosUsuarioViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "DadosDoUsuarioCell", for: indexPath) as? DadosUsuarioScreenViewCell else {
            fatalError("error to create ViagemTableViewCell")
        }

        switch indexPath.row {
        case 0:
            celula.configuraInfo(icon: "folder.badge.person.crop", info: "Seus dados")
        case 1:
            celula.configuraInfo(icon: "star.circle", info: "Seus favoritos")
        case 2:
            celula.configuraInfo(icon: "bag.circle", info: "Suas compras")
        case 3:
            celula.configuraInfo(icon: "cart.fill", info: "Seu carrinho")
        case 4:
            celula.configuraInfo(icon: "return.left", info: "Sair")
        default:
            break
        }
        
        return celula
        
    }
}

extension DadosUsuarioViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            debugPrint("0")
        case 1:
            debugPrint("1")
        case 2:
            debugPrint("2")
        case 3:
            debugPrint("3")
        case 4:
            sairDoApp()
        default:
            break
        }
    }
    
}

