//
//  SuasComprasViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 08/05/23.
//

import Foundation
import UIKit

class SuasComprasViewController: UIViewController {
    
    private var customView: SuasComprasScreenView? = nil
    private var celulas: [SuasComprasScreenViewCell]? = nil
    private var pacotesModel = UserViewModel.body.packages
    private var voosModel = UserViewModel.body.flights
    private var hoteisModel = UserViewModel.body.hotels
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = rightItem
        configuraTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView?.tableView.reloadData()
    }
    
    func buildView() {
        view = SuasComprasScreenView()
        customView = view as? SuasComprasScreenView
    }
    
    @objc func rightItemTapped() {
        debugPrint("teste")
        navigateToMenuUsuario()
    }
    
    func configuraTableView() {
        customView?.tableView.register(SuasComprasScreenViewCell.self, forCellReuseIdentifier: "SuasComprasScreenViewCell")
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
            let vooController = VoosViewController.instanciar(viagemSelecionada)
            navigationController?.pushViewController(vooController, animated: true)
        }
    }
    
    func irParaDetalhesHotel(_ viagem: HoteisModel.Hotel?) {
        if let viagemSelecionada = viagem {
            let hotelController = HoteisViewController.instanciar(viagemSelecionada)
            navigationController?.pushViewController(hotelController, animated: true)
        }
    }
    
    func irParaDetalhesPacote(_ viagem: PacotesModel.Pacote?) {
        if let viagemSelecionada = viagem {
            let pacoteController = PacotesViewController.instanciar(viagemSelecionada)
            navigationController?.pushViewController(pacoteController, animated: true)
        }
    }
}

extension SuasComprasViewController: UITableViewDataSource {
    
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
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch indexPath.section {
        case 0:
            // CELULA DO VOO
            guard let celulaViagemVoo = tableView.dequeueReusableCell(withIdentifier: "SuasComprasScreenViewCell", for: indexPath) as? SuasComprasScreenViewCell else { fatalError("error to create ViagemTableViewCell") }
                
            if voosModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagemVoo.configuraInfo(icon: "airplane.circle.fill", title: voosModel[indexPath.row]?.name ?? "", departureDate: voosModel[indexPath.row]?.departureDate ?? "", returnDate: voosModel[indexPath.row]?.returnDate ?? "")
                return celulaViagemVoo
            }
            
        case 1:
            // CELULA DO HOTEL
            guard let celulaViagemHotel = tableView.dequeueReusableCell(withIdentifier: "SuasComprasScreenViewCell", for: indexPath) as? SuasComprasScreenViewCell else { fatalError("error to create ViagemTableViewCell") }
            
            if hoteisModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagemHotel.configuraInfo(icon: "building.2.crop.circle.fill", title: hoteisModel[indexPath.row]?.nome ?? "", departureDate: hoteisModel[indexPath.row]?.dataChegada ?? "", returnDate: hoteisModel[indexPath.row]?.dataSaida ?? "")
                return celulaViagemHotel
            }
            
        case 2:
            // CELULA DO PACOTE
            guard let celulaViagemPacote = tableView.dequeueReusableCell(withIdentifier: "SuasComprasScreenViewCell", for: indexPath) as? SuasComprasScreenViewCell else { fatalError("error to create ViagemTableViewCell") }
                
            if pacotesModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagemPacote.configuraInfo(icon: "signpost.right.and.left.circle.fill", title: pacotesModel[indexPath.row]?.title ?? "", departureDate: pacotesModel[indexPath.row]?.departureDate ?? "", returnDate: pacotesModel[indexPath.row]?.returnDate ?? "")
                return celulaViagemPacote
          }
        default:
            return UITableViewCell()
        }
    }
}

extension SuasComprasViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
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
            break
        }
    }
    
}

