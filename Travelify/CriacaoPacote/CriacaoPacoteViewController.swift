//
//  CriacaoPacoteViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 05/06/23.
//

import Foundation
import UIKit

class CriacaoPacoteViewController: UIViewController {
    
    private var customView: CriacaoPacoteScreenView? = nil
    private var model: CriacaoPacoteModel? = nil
    private var voosModel = UserViewModel.body.flights
    private var hoteisModel = UserViewModel.body.hotels
    private var vooId: Int = 0
    private var hotalId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: CriacaoPacoteViewController())
        buildView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cleanFields()
        configuraDropDownHotel()
        configuraDropDownVoo()
    }
    
    func buildView() {
        view = CriacaoPacoteScreenView()
        customView = view as? CriacaoPacoteScreenView
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }

    func cleanFields() {
        customView?.destinyText.text = ""
        customView?.returnDateText.text = ""
        customView?.nomeText.text = ""
        customView?.originText.text = ""
        customView?.departureDateText.text = ""
        customView?.priceText.text = ""
        customView?.imageText.text = ""
    }
    
    func configuraDropDownHotel() {
        customView?.dropDownHotel.backgroundColor = .white
        customView?.dropDownHotel.placeholder = "Escolha o hotel"
        customView?.dropDownHotel.selectedRowColor = UIColor(named: "backgroundColorDark") ?? .cyan
        let hoteis = hoteisModel.compactMap { $0 }
        customView?.dropDownHotel.optionArray = hoteis.map { $0.nome }
        customView?.dropDownHotel.optionIds = hoteis.map { $0.id }
        customView?.dropDownHotel.didSelect{(selectedText , index ,id) in
            debugPrint(selectedText, index, id)
            self.hotalId = id
        }
    }
    
    func configuraDropDownVoo() {
        customView?.dropDownVoo.backgroundColor = .white
        customView?.dropDownVoo.placeholder = "Escolha o Voo"
        customView?.dropDownVoo.selectedRowColor = UIColor(named: "backgroundColorDark") ?? .cyan
        let hoteis = voosModel.compactMap { $0 }
        customView?.dropDownVoo.optionArray = hoteis.map { $0.name }
        customView?.dropDownVoo.optionIds = hoteis.map { $0.id }
        customView?.dropDownVoo.didSelect{(selectedText , index ,id) in
            debugPrint(selectedText, index, id)
            self.vooId = id
        }
    }
    
    func getData() {
        guard let nome = customView?.nomeText.text, let origem = customView?.originText.text, let destino = customView?.destinyText.text, let departureDate = customView?.departureDateText.text, let returnDate = customView?.returnDateText.text, let price = customView?.priceText.text, let mainImage = customView?.imageText.text else { return}
        
        let priceInt = Int(price)
        
        model = CriacaoPacoteModel(mainImage: mainImage, departureDate: departureDate, returnDate: returnDate, origin: origem, destiny: destino, title: nome, idUser: UserViewModel.body.id, price: priceInt ?? 0, idHotel: hotalId, idFlight: vooId)
    }
    
    func navigateToVendas() {
        let vc = ComAnuncioViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func callUser() {
        let model = LoginModel(password: UserViewModel.body.password, username: UserViewModel.body.username)
        
        do {
            let service = LoginService()
            service.apiCall(model: model, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        let userResponse = data as! UserResponse
                        UserViewModel.body = userResponse
                        self.navigateToVendas()
                    }
                }
            })
        }
    }

    @objc func cadastro(_ sender: UIButton) {
            self.getData()

            guard let model = model else { return }

        do {
            let service = CriacaoPacoteService()
            service.apiCall(model: model, callback: {
                result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        print(data)
                        self.callUser()
                    }
                }
            })
        }
    }
}
