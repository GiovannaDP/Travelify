//
//  VoosViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class VoosViewController: UIViewController {
    
    var voo: VoosModel.Voo?
    
    class func instanciar(_ viagem: VoosModel.Voo) -> VoosViewController {
        let vooViewController = VoosViewController()
        vooViewController.voo = viagem
        return vooViewController
    }
    
    private var customView: VoosScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraView()
    }
    
    func buildView() {
        view = VoosScreenView()
        customView = view as? VoosScreenView
        customView?.comprarButton.addTarget(self, action: #selector(comprarVoo), for: .touchUpInside)
    }
    
    func configuraView() {
        customView?.titleLabel.text = voo?.name ?? ""
        customView?.imageView.image = UIImage(named: voo?.images[0].image ?? "Londres-1")
        customView?.tituloVooLabel.text = voo?.destiny
        customView?.origemLabel.text = voo?.origin
        customView?.departureDateLabel.text = voo?.departureDate
        customView?.returnDateLabel.text = voo?.returnDate
        customView?.vagasRestantesLabel.text = "Vagas restantes: \(voo?.availableSeats ?? "")"
        customView?.precoLabel.text = "R$\(voo?.price ?? 0)"
        customView?.classeLabel.text = voo?.classType
    }
    
    @objc func comprarVoo(_ sender: UIButton) {
        let vc = TelaConfirmacaoViewController()
        guard let voo = voo else { return }
        let user = UserViewModel.User(id: 3, username: "00000000000", name: "Julia Valente", profileType: "CPF", email: "juliavalente@gmail.com", phone: "16999999999", hotels: [], flights: [], packages: [], messages: [], error: "")
        vc.instanciar(user: user, voo: voo)
        navigationController?.pushViewController(vc, animated: true)
    }
}


