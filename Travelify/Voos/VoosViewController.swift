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
    var flow: Flow?
    
    class func instanciar(_ viagem: VoosModel.Voo, flow: Flow) -> VoosViewController {
        let vooViewController = VoosViewController()
        vooViewController.voo = viagem
        vooViewController.flow = flow
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
        
        switch flow {
        case .primeiraCompra:
            debugPrint("primeira compra")
        case .suasCompras:
            customView?.comprarButton.isHidden = true
        case .suasVendas:
            customView?.comprarButton.isHidden = true
        default:
            break
        }
    }
    
    func configuraView() {
        
        guard let vagas = voo?.availableSeats else { return }
        if UIImage(named: voo?.images[0]?.image ?? "") != nil {
            customView?.imageView.image = UIImage(named: voo?.images[0]?.image ?? "voo")
        } else {
            customView?.imageView.image = UIImage(named: "voo")
        }
        customView?.titleLabel.text = voo?.name ?? ""
        customView?.tituloVooLabel.text = voo?.destiny
        customView?.origemLabel.text = voo?.origin
        customView?.departureDateLabel.text = voo?.departureDate
        customView?.returnDateLabel.text = voo?.returnDate
        customView?.vagasRestantesLabel.text = "Vagas restantes: \(vagas)"
        customView?.precoLabel.text = "R$\(voo?.price ?? 0)"
        customView?.classeLabel.text = voo?.classType
    }
    
    @objc func comprarVoo(_ sender: UIButton) {
        let vc = TelaConfirmacaoViewController()
        guard let voo = voo else { return }
        vc.instanciar(voo: voo)
        navigationController?.pushViewController(vc, animated: true)
    }
}
