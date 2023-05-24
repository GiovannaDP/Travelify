//
//  PacotesViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class PacotesViewController: UIViewController {
    
    var pacote: PacotesModel.Pacote?
    
    class func instanciar(_ viagem: PacotesModel.Pacote) -> PacotesViewController {
        let pacoteViewController = PacotesViewController()
        pacoteViewController.pacote = viagem
        
        return pacoteViewController
    }
    
    private var customView: PacotesScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraView()
    }
    
    func buildView() {
        view = PacotesScreenView()
        customView = view as? PacotesScreenView
        customView?.comprarButton.addTarget(self, action: #selector(reservarPacote), for: .touchUpInside)
    }
    
    func configuraView() {
        
        guard let price = pacote?.price, let available = pacote?.flight.availableSeats else { return }
        customView?.titleLabel.text = pacote?.hotel.nome
        customView?.imageView.image = UIImage(named: pacote?.images?[0].image ?? "Londres-1")
        customView?.tituloVooLabel.text = pacote?.flight.destiny
        customView?.origemLabel.text = pacote?.flight.origin
        customView?.hotelLabel.text = pacote?.hotel.nome
        customView?.companyLabel.text = pacote?.flight.airline
        customView?.departureDateLabel.text = pacote?.flight.departureDate
        customView?.returnDateLabel.text = pacote?.flight.returnDate
        customView?.vagasRestantesLabel.text = "Vagas restantes: \(available)"
        customView?.precoLabel.text = "R$\(price)"
        customView?.classeLabel.text = pacote?.flight.classType
    }
    
    @objc func reservarPacote(_ sender: UIButton) {
        let vc = TelaConfirmacaoViewController()
        guard let pacote = pacote else { return }
        vc.instanciar(pacote: pacote)
        navigationController?.pushViewController(vc, animated: true)
    }
}

