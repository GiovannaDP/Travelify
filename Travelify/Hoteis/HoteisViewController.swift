//
//  HoteisViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class HoteisViewController: UIViewController {
    
    var hotel: HoteisModel.Hotel?
    
    class func instanciar(_ viagem: HoteisModel.Hotel) -> HoteisViewController {
        let hotelViewController = HoteisViewController()
        hotelViewController.hotel = viagem
        
        return hotelViewController
    }
    
    private var customView: HoteisScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraView()
        
    }
    
    func buildView() {
        view = HoteisScreenView()
        customView = view as? HoteisScreenView
        customView?.comprarButton.addTarget(self, action: #selector(reservarHotel), for: .touchUpInside)
    }
    
    func configuraView() {
        
        guard let price = hotel?.precoDiaria, let nota = hotel?.nota, let nome = hotel?.nome, let local = hotel?.local else { return }
        let notaString: String

        customView?.titleLabel.text = "\(nome) - \(local)"
        customView?.departureDateLabel.text = hotel?.dataChegada
        customView?.returnDateLabel.text = hotel?.dataSaida
        customView?.precoLabel.text = "R$ \(price)"
        
        if nota == 0 {
            notaString = "Sem avaliações"
            customView?.notaLabel.text = notaString
        } else {
            customView?.notaLabel.text = "Nota: \(hotel?.nota)"
        }
    }
    
    @objc func reservarHotel(_ sender: UIButton) {
        let vc = TelaConfirmacaoViewController()
        guard let hotel = hotel else { return }
        let user = UserViewModel.User(id: 3, username: "00000000000", name: "Julia Valente", profileType: "CPF", email: "juliavalente@gmail.com", phone: "16999999999", hotels: [], flights: [], packages: [], messages: [], error: "")
        vc.instanciar(user: user, hotel: hotel)
        navigationController?.pushViewController(vc, animated: true)
    }
}
