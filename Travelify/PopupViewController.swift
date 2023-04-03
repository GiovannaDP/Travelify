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
        //        customView?.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        //        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }
}
