//
//  FavoritosViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 22/05/23.
//

import Foundation
import UIKit

class FavoritosViewController: UIViewController {
    
    private var customView: FavoritosScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraNavBar()
    }
    
    func buildView() {
        view = FavoritosScreenView()
        customView = view as? FavoritosScreenView
    }
    
    func configuraNavBar() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "house.fill"), style: .plain, target: self, action: #selector(leftItemTapped))
        leftItem.tintColor = .white
        
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func rightItemTapped() {
        navigateToMenuUsuario()
    }
    
    @objc func leftItemTapped() {
        popToTelaInicialCompras()
    }
}


