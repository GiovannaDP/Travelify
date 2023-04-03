//
//  VendasViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class VendasViewController: UIViewController {
    
    private var customView: VendasScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func buildView() {
        view = VendasScreenView()
        customView = view as? VendasScreenView
    }
    
    @objc func rightItemTapped() {
        debugPrint("teste")
        navigateToMenuVendedor()
    }
}
