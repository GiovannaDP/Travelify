//
//  PerfilVendedorViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 25/04/23.
//

import Foundation
import UIKit

class PerfilVendedorViewController: UIViewController {
    
    private var customView: PerfilVendedorScreenView? = nil
    private var model: PerfilModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightItemTapped))
        rightItem.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = rightItem
        setupItens()
    }
    
    func buildView() {
        view = PerfilVendedorScreenView()
        customView = view as? PerfilVendedorScreenView
        customView?.editarButton.addTarget(self, action: #selector(atualizarDados), for: .touchUpInside)
    }
    
    @objc func rightItemTapped() {
        debugPrint("teste")
        navigateToMenuVendedor()
    }
    
    func getData() {
        guard let email = customView?.emailText.text, let name = customView?.nameText.text,  let phone = customView?.phoneText.text, let secureTextField = customView?.passwordText, let text = secureTextField.text else { return }
        let unmaskedString = NSString(string: text)
        model = PerfilModel(email: email, name: name, password: unmaskedString as String, phone: phone, id: UserViewModel.body.id)
    }
    
    @objc func atualizarDados(_ sender: UIButton) {
        getData()
        guard let perfilModel = model else { return }
        
        debugPrint("ATUALIZAR DADOOOS")

        do {
            let service = PerfilVendedorService()
            service.apiCall(model: perfilModel, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
//                        userResponse = data as! UserResponse
//                        guard let model = userResponse else { return }
//                        UserViewModel.body = model
                        print(data)
                    }
                }
            })
        }
    }
    
    func setupItens() {
        customView?.nameText.text = UserViewModel.body.name
        customView?.passwordText.text = UserViewModel.body.password
        customView?.usernameText.text = UserViewModel.body.username
        customView?.emailText.text = UserViewModel.body.email
        customView?.phoneText.text = UserViewModel.body.phone
    }
}
