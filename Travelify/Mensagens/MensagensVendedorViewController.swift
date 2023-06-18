//
//  MensagensVendedorViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class MensagensVendedorViewController: UIViewController {
    
    private var customView: MensagensVendedorScreenView? = nil
    private var celulas: [MensagensVendedorScreenViewCell]? = nil
    private var messagesModel = UserViewModel.body.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraNavBar()        
        configuraTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if messagesModel.isEmpty {
            customView?.tableView.isHidden = true
            customView?.semAnuncioView.isHidden = false
        } else {
            customView?.tableView.isHidden = false
            customView?.semAnuncioView.isHidden = true
        }
        customView?.tableView.reloadData()
    }
    
    func buildView() {
        view = MensagensVendedorScreenView()
        customView = view as? MensagensVendedorScreenView
    }
    
    func configuraNavBar() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "house.fill"), style: .plain, target: self, action: #selector(leftItemTapped))
        leftItem.tintColor = .white
        
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func rightItemTapped() {
        navigateToMenuVendedor()
    }
    
    @objc func leftItemTapped() {
        popToTelaInicialVendas()
    }
    
    func configuraTableView() {
        customView?.tableView.register(MensagensVendedorScreenViewCell.self, forCellReuseIdentifier: "MensagensVendedorScreenViewCell")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
    
    func sairDoApp() {
        if let telaAnterior = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) {
            navigationController?.popToViewController(telaAnterior, animated: true)
        }
    }
    
    func irParaDetalhesVoo(_ viagem: VoosModel.Voo?) {
        if let viagemSelecionada = viagem {
            let vooController = VoosViewController.instanciar(viagemSelecionada, flow: .suasVendas)
            navigationController?.pushViewController(vooController, animated: true)
        }
    }
    
    func irParaDetalhesHotel(_ viagem: HoteisModel.Hotel?) {
        if let viagemSelecionada = viagem {
            let hotelController = HoteisViewController.instanciar(viagemSelecionada, flow: .suasVendas)
            navigationController?.pushViewController(hotelController, animated: true)
        }
    }
    
    func irParaDetalhesPacote(_ viagem: PacotesModel.Pacote?) {
        if let viagemSelecionada = viagem {
            let pacoteController = PacotesViewController.instanciar(viagemSelecionada, flow: .suasVendas)
            navigationController?.pushViewController(pacoteController, animated: true)
        }
    }
}

extension MensagensVendedorViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            guard let celula = tableView.dequeueReusableCell(withIdentifier: "MensagensVendedorScreenViewCell", for: indexPath) as? MensagensVendedorScreenViewCell else { fatalError("error to create ViagemTableViewCell") }
                
            if messagesModel.isEmpty {
                return UITableViewCell()
            } else {
                celula.configuraInfo(title: messagesModel[indexPath.row]?.message ?? "")
                return celula
            }
    }
}

extension MensagensVendedorViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("clicou mensagem")
    }
}
