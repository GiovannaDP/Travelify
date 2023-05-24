//
//  PopupViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 02/04/23.
//

import Foundation
import UIKit

class PopupViewController: UIViewController {
    
    private var customView: PopupScreenView? = nil
    private var vooModel: VoosModel.Voo? = nil
    private var hotelModel: HoteisModel.Hotel? = nil
    private var pacoteModel: PacotesModel.Pacote? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }

    func buildView() {
        view = PopupScreenView()
        customView = view as? PopupScreenView
        customView?.confirmButton.addTarget(self, action: #selector(confirmar), for: .touchUpInside)
        customView?.cancelButton.addTarget(self, action: #selector(cancelar), for: .touchUpInside)
    }
    
    func instanciar(voo: VoosModel.Voo? = nil, hotel: HoteisModel.Hotel? = nil, pacote: PacotesModel.Pacote? = nil) {
        self.vooModel = voo
        self.hotelModel = hotel
        self.pacoteModel = pacote
    }
    
    @objc func confirmar(_ sender: UIButton) {
        
        if let vooModel {
            let confirmacaoModel = ConfirmacaoVooModel(idUser: UserViewModel.body.id, idFlight: vooModel.id, persons: 1)
            callVoo(model: confirmacaoModel)
        } else if let hotelModel {
            let confirmacaoModel = ConfirmacaoHotelModel(idUser: UserViewModel.body.id, idHotel: hotelModel.id, persons: 1)
            callHotel(model: confirmacaoModel)
        } else if let pacoteModel {
            let confirmacaoModel = ConfirmacaoPacoteModel(idUser: UserViewModel.body.id, idPackage: pacoteModel.id, persons: 1)
            callPacote(model: confirmacaoModel)
        }
    }
    
    func routeToSuasCompras() {
        let vc = SuasComprasViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
                    }
                }
            })
        }
    }
    
    func callVoo(model: ConfirmacaoVooModel) {
        do {
            let service = ConfirmacaoService()
            service.apiCallVoo(model: model, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        print(data)
                        self.callUser()
                        self.routeToSuasCompras()
                    }
                }
            })
        }
    }
    
    func callHotel(model: ConfirmacaoHotelModel) {
        do {
            let service = ConfirmacaoService()
            service.apiCallHotel(model: model, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        print(data)
                        self.callUser()
                        self.routeToSuasCompras()
                    }
                }
            })
        }
    }
    
    func callPacote(model: ConfirmacaoPacoteModel) {
        do {
            let service = ConfirmacaoService()
            service.apiCallPacote(model: model, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        print(data)
                        self.callUser()
                        self.routeToSuasCompras()
                    }
                }
            })
        }
    }
    
    @objc func cancelar(_ sender: UIButton) {
        let vc = TelaInicialViewController()
        self.navigationController?.popToViewController(vc, animated: true)
    }
}
