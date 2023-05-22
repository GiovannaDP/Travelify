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
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func buildView() {
        view = FavoritosScreenView()
        customView = view as? FavoritosScreenView
    }
    
    @objc func rightItemTapped() {
        navigateToMenuUsuario()
    }
}


