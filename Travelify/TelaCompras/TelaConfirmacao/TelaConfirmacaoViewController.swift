//
//  TelaConfirmacaoViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class TelaConfirmacaoViewController: UIViewController {
    
    private var customView: TelaConfirmacaoScreenView? = nil
    private var vooModel: VoosModel.Voo? = nil
    private var hotelModel: HoteisModel.Hotel? = nil
    private var pacoteModel: PacotesModel.Pacote? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = rightItem
        chooseSetupView()
        setupItens()
    }
    
    func chooseSetupView() {
        if let voo = vooModel {
            setupViewVoo()
        } else if let hotel = hotelModel {
            setupViewHotel()
        } else if let pacote = pacoteModel {
            setupViewHPacotes()
        }
    }
    
    func buildView() {
        view = TelaConfirmacaoScreenView()
        customView = view as? TelaConfirmacaoScreenView
        customView?.escolherOutroButton.addTarget(self, action: #selector(escolherOutroVoo), for: .touchUpInside)
        customView?.confirmarButton.addTarget(self, action: #selector(confirmar), for: .touchUpInside)
    }
    
    func instanciar(voo: VoosModel.Voo? = nil, hotel: HoteisModel.Hotel? = nil, pacote: PacotesModel.Pacote? = nil) {
        self.vooModel = voo
        self.hotelModel = hotel
        self.pacoteModel = pacote
    }
    
    @objc func rightItemTapped() {
        navigateToMenuUsuario()
    }
    
    @objc func escolherOutroVoo(_ sender: UIButton) {
        if let telaAnterior = navigationController?.viewControllers.first(where: { $0 is TelaInicialViewController }) {
            navigationController?.popToViewController(telaAnterior, animated: true)
        }
    }
    
    @objc func confirmar(_ sender: UIButton) {
        let vc = PopupViewController()
        vc.instanciar(voo: vooModel, hotel: hotelModel, pacote: pacoteModel)
        vc.modalTransitionStyle = .coverVertical
        
        let transicao = CATransition()
        transicao.duration = 0.3
        transicao.type = CATransitionType.moveIn
        transicao.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transicao, forKey: kCATransition)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func setupViewVoo() {
        customView?.origemDestinoLabel.text = "Voo"
        customView?.datasLabel.text = "Datas do voo"
        customView?.classeDoVooLabel.text = "Classe do voo"
        customView?.escolherOutroButton.setTitle("Escolher outro voo", for: .normal)
    }
    
    func setupViewHotel() {
        customView?.origemDestinoLabel.text = "Hotel"
        customView?.datasLabel.text = "Datas da hospedagem"
        customView?.classeDoVooLabel.text = "Local"
        customView?.escolherOutroButton.setTitle("Escolher outro hotel", for: .normal)
    }
    
    func setupViewHPacotes() {
        customView?.origemDestinoLabel.text = "Pacote"
        customView?.datasLabel.text = "Datas"
        customView?.classeDoVooLabel.text = "Hotel + Voo"
        customView?.escolherOutroButton.setTitle("Escolher outro pacote", for: .normal)
    }
    
    func setupItens() {
        customView?.nomeCompletoText.text = UserViewModel.body.name
        customView?.cpfText.text = UserViewModel.body.username
        customView?.emailText.text = UserViewModel.body.email
        customView?.phoneText.text = UserViewModel.body.phone
        
        if let voo = vooModel {
            customView?.origemDestinoText.text = "\(voo.origin) -> \(voo.destiny)"
            customView?.datasText.text = "\(voo.departureDate) - \(voo.returnDate)"
            customView?.classeDoVooText.text = voo.classType
        } else if let hotel = hotelModel {
            customView?.origemDestinoText.text = "\(hotel.nome)"
            customView?.datasText.text = "\(hotel.dataChegada) - \(hotel.dataSaida)"
            customView?.classeDoVooText.text = "\(hotel.local)"
        } else if let pacote = pacoteModel {
            customView?.origemDestinoText.text = "\(pacote.origin) -> \(pacote.destiny)"
            customView?.datasText.text = "\(pacote.departureDate) - \(pacote.returnDate)"
            customView?.classeDoVooText.text = "\(pacote.hotel.nome) -> \(pacote.flight.airline)"
        }
    }
}
