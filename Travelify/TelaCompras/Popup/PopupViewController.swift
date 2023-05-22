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
    
    @objc func confirmar(_ sender: UIButton) {
        let vc = CadastroViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func cancelar(_ sender: UIButton) {
        debugPrint("chegou")
        let vc = TelaInicialViewController()
        self.navigationController?.popToViewController(vc, animated: true)
    }
}
