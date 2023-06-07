//
//  ComAnuncioViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class ComAnuncioViewController: UIViewController{
    
    private var customView: ComAnuncioScreenView? = nil
    private var pacotesModel = UserViewModel.body.packages
    private var voosModel = UserViewModel.body.flights
    private var hoteisModel = UserViewModel.body.hotels
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraNavBar()
        configuraTableView()

        view.backgroundColor = UIColor(named: "backgroundColorDark")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView?.tableView.reloadData()
    }

    func buildView() {
        view = ComAnuncioScreenView()
        customView = view as? ComAnuncioScreenView
        customView?.cadastroAnuncioButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }
    
    func configuraNavBar() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        let leftItem = UIBarButtonItem()
    
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc func rightItemTapped() {
        navigateToMenuVendedor()
    }
    
    func configuraTableView() {
        customView?.tableView.register(VoosScreenViewCell.self, forCellReuseIdentifier: "VoosScreenViewCell")
        customView?.tableView.register(HoteisScreenViewCell.self, forCellReuseIdentifier: "HoteisScreenViewCell")
        customView?.tableView.register(PacotesScreenViewCell.self, forCellReuseIdentifier: "PacotesScreenViewCell")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
    
    @objc func cadastro(_ sender: UIButton) {
        let vc = EscolhaTipoCriacaoViewController()
        navigationController?.pushViewController(vc, animated: true)
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

extension ComAnuncioViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return voosModel.count
        case 1:
            return hoteisModel.count
        case 2:
            return pacotesModel.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 350 : 475
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            // CELULA DO VOO
            guard let celulaViagemVoo = tableView.dequeueReusableCell(withIdentifier: "VoosScreenViewCell", for: indexPath) as? VoosScreenViewCell else { fatalError("error to create ViagemTableViewCell") }
                
            if voosModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagemVoo.configuraCelula(voosModel[indexPath.row])
                return celulaViagemVoo
            }
        case 1:
            // CELULA DO HOTEL
            guard let celulaViagemHotel = tableView.dequeueReusableCell(withIdentifier: "HoteisScreenViewCell", for: indexPath) as? HoteisScreenViewCell else { fatalError("error to create ViagemTableViewCell") }
            if hoteisModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagemHotel.configuraCelula(hoteisModel[indexPath.row])
                return celulaViagemHotel
            }
        case 2:
        // CELULA DO PACOTE
        guard let celulaViagemPacote = tableView.dequeueReusableCell(withIdentifier: "PacotesScreenViewCell", for: indexPath) as? PacotesScreenViewCell else { fatalError("error to create ViagemTableViewCell") }
            
        if pacotesModel.isEmpty {
            return UITableViewCell()
        } else {
            celulaViagemPacote.configuraCelula(pacotesModel[indexPath.row])
            return celulaViagemPacote
        }
        default:
            return UITableViewCell()
        }
    }
}

extension ComAnuncioViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            let viewModel = voosModel[indexPath.row]
            irParaDetalhesVoo(viewModel)
        case 1:
            let viewModel = hoteisModel[indexPath.row]
            irParaDetalhesHotel(viewModel)
        case 2:
            let viewModel = pacotesModel[indexPath.row]
            irParaDetalhesPacote(viewModel)
        default:
            debugPrint("outros")
        }
    }
}
