//
//  PerfilUsuarioViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class PerfilUsuarioController: UIViewController {
    
    private var customView: PerfilUsuarioView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func buildView() {
        view = PerfilUsuarioView()
        customView = view as? PerfilUsuarioView
    }
    
    @objc func rightItemTapped() {
        debugPrint("teste")
        navigateToMenuVendedor()
    }
}

