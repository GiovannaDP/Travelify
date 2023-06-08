//
//  TelaInicialViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class TelaInicialViewController: UIViewController{
    
    private var customView: TelaInicialScreenView? = nil
    private var button: String? = nil
    private var pacotesModel: [PacotesModel.Pacote?] = []
    private var voosModel: [VoosModel.Voo?] = []
    private var hoteisModel: [HoteisModel.Hotel?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraTableView()
        configuraNavBar()
        
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPacotes()
        getVoos()
        getHoteis()
    }
    
    func buildView() {
        view = TelaInicialScreenView()
        customView = view as? TelaInicialScreenView
        customView?.buttonPacotes.addTarget(self, action: #selector(pacotes), for: .touchUpInside)
        customView?.buttonVoos.addTarget(self, action: #selector(voos), for: .touchUpInside)
        customView?.buttonHoteis.addTarget(self, action: #selector(hoteis), for: .touchUpInside)
        button = "pacotes"
    }
    
    func configuraNavBar() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        let leftItem = UIBarButtonItem()
    
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc func rightItemTapped() {
        navigateToMenuUsuario()
    }
    
    func configuraTableView() {
        customView?.tableView.register(VoosScreenViewCell.self, forCellReuseIdentifier: "VoosScreenViewCell")
        customView?.tableView.register(HoteisScreenViewCell.self, forCellReuseIdentifier: "HoteisScreenViewCell")
        customView?.tableView.register(PacotesScreenViewCell.self, forCellReuseIdentifier: "PacotesScreenViewCell")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
    
    @objc func pacotes(_ sender: UIButton) {
        button = "pacotes"
        checkButton()
    }
    
    @objc func voos(_ sender: UIButton) {
        button = "voos"
        checkButton()
    }
    
    @objc func hoteis(_ sender: UIButton) {
        button = "hoteis"
        checkButton()
    }
    
    func getPacotes() {
        do {
            let service = PacotesService()
            service.apiCall(callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        self.pacotesModel = data as? [PacotesModel.Pacote] ?? []
                        self.customView?.tableView.reloadData()
                        print(self.pacotesModel)
                    }
                }
            })
        }
    }
    
    func getVoos() {
        do {
            let service = VoosService()
            service.apiCall(callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        self.voosModel = data as? [VoosModel.Voo] ?? []
                        print(self.voosModel)
                    }
                }
            })
        }
    }
    
    func getHoteis() {
        do {
            let service = HoteisService()
            service.apiCall(callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        self.hoteisModel = data as? [HoteisModel.Hotel] ?? []
                        print(self.hoteisModel)
                    }
                }
            })
        }
    }
    
    func checkButton() {
        guard let button = button else { return }
        if button == "pacotes" {
            customView?.buttonPacotes.isSelected = true
            customView?.buttonVoos.isSelected = false
            customView?.buttonHoteis.isSelected = false
        } else if button == "voos" {
            customView?.buttonVoos.isSelected = true
            customView?.buttonPacotes.isSelected = false
            customView?.buttonHoteis.isSelected = false
        } else {
            customView?.buttonHoteis.isSelected = true
            customView?.buttonVoos.isSelected = false
            customView?.buttonPacotes.isSelected = false
        }
        customView?.tableView.reloadData()
    }
    
    func irParaDetalhesVoo(_ viagem: VoosModel.Voo?) {
        if let viagemSelecionada = viagem {
            let vooController = VoosViewController.instanciar(viagemSelecionada, flow: .primeiraCompra)
            navigationController?.pushViewController(vooController, animated: true)
        }
    }
    
    func irParaDetalhesHotel(_ viagem: HoteisModel.Hotel?) {
        if let viagemSelecionada = viagem {
            let hotelController = HoteisViewController.instanciar(viagemSelecionada, flow: .primeiraCompra)
            navigationController?.pushViewController(hotelController, animated: true)
        }
    }
    
    func irParaDetalhesPacote(_ viagem: PacotesModel.Pacote?) {
        if let viagemSelecionada = viagem {
            let pacoteController = PacotesViewController.instanciar(viagemSelecionada, flow: .primeiraCompra)
            navigationController?.pushViewController(pacoteController, animated: true)
        }
    }
    
    @objc func rightItemTapped() {
        navigateToMenuUsuario()
    }
}

extension TelaInicialViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch button {
        case "voos":
            return voosModel.count
        case "pacotes":
            return pacotesModel.count
        case "hoteis":
            return hoteisModel.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 350 : 475
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if button == "voos" {
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "VoosScreenViewCell", for: indexPath) as? VoosScreenViewCell else {
               fatalError("error to create ViagemTableViewCell")
           }
            
            if voosModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagem.configuraCelula(voosModel[indexPath.row])
                return celulaViagem
            }
            
            
        } else if button == "pacotes" {
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "PacotesScreenViewCell", for: indexPath) as? PacotesScreenViewCell else {
                fatalError("error to create ViagemTableViewCell")
            }
            
            if pacotesModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagem.configuraCelula(pacotesModel[indexPath.row])
                return celulaViagem
            }
            
        } else {
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "HoteisScreenViewCell", for: indexPath) as? HoteisScreenViewCell else {
               fatalError("error to create ViagemTableViewCell")
           }
            if hoteisModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagem.configuraCelula(hoteisModel[indexPath.row])
                return celulaViagem
            }
        }
    }
}

extension TelaInicialViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch button {
        case "voos":
            let viewModel = voosModel[indexPath.row]
            irParaDetalhesVoo(viewModel)
        case "hoteis":
            let viewModel = hoteisModel[indexPath.row]
            irParaDetalhesHotel(viewModel)
        case "pacotes":
            let viewModel = pacotesModel[indexPath.row]
            irParaDetalhesPacote(viewModel)
        default:
            debugPrint("outros")
        }
    }
}
