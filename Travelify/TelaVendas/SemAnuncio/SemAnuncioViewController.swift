//
//  SemAnuncioViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class SemAnuncioViewController: UIViewController {
    
    private var customView: SemAnuncioScreenView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        let leftItem = UIBarButtonItem()
        
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func buildView() {
        view = SemAnuncioScreenView()
        customView = view as? SemAnuncioScreenView
    }
    
    @objc func rightItemTapped() {
        navigateToMenuVendedor()
    }
}
