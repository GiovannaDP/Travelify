//
//  PerfilUsuarioViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class PerfilUsuarioController: UIViewController {
    
    private var customView: PerfilUsuarioScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        setupItens()
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func buildView() {
        view = PerfilUsuarioScreenView()
        customView = view as? PerfilUsuarioScreenView
    }
    
    @objc func rightItemTapped() {
        debugPrint("teste")
        navigateToMenuVendedor()
    }
    
    func setupItens() {
        customView?.nameText.text = UserViewModel.body.name
        customView?.usernameText.text = UserViewModel.body.username
        customView?.emailText.text = UserViewModel.body.email
        customView?.phoneText.text = UserViewModel.body.phone
    }
}
