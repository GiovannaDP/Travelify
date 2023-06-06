//
//  EscolhaTipoCriacaoViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/04/23.
//

import Foundation
import UIKit

class EscolhaTipoCriacaoViewController: UIViewController {
    
    private var customView: EscolhaTipoCriacaoScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: EscolhaTipoCriacaoViewController())
        buildView()
    }
    
    func buildView() {
        view = EscolhaTipoCriacaoScreenView()
        customView = view as? EscolhaTipoCriacaoScreenView
        customView?.criarVooButton.addTarget(self, action: #selector(criarVoo), for: .touchUpInside)
        customView?.criarHotelButton.addTarget(self, action: #selector(criarHotel), for: .touchUpInside)
        customView?.criarPacoteButton.addTarget(self, action: #selector(criarPacote), for: .touchUpInside)
    }

    @objc func criarVoo(_ sender: UIButton) {
        let vc = CriacaoVooViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func criarHotel(_ sender: UIButton) {
        let vc = CriacaoHotelViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func criarPacote(_ sender: UIButton) {
        let vc = CriacaoPacoteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
