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
    private var model: PerfilModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupItens()
    }
    
    func buildView() {
        view = PerfilUsuarioScreenView()
        customView = view as? PerfilUsuarioScreenView
        customView?.editarButton.addTarget(self, action: #selector(atualizarDados), for: .touchUpInside)
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
    
    func getData() {
        guard let email = customView?.emailText.text, let name = customView?.nameText.text,  let phone = customView?.phoneText.text, let secureTextField = customView?.passwordText, let text = secureTextField.text else { return }
        let unmaskedString = NSString(string: text)
        model = PerfilModel(email: email, name: name, password: unmaskedString as String, phone: phone, id: UserViewModel.body.id)
    }
    
    func callUser() {
        let model = LoginModel(password: UserViewModel.body.password, username: UserViewModel.body.username)
        
        do {
            let service = LoginService()
            service.apiCall(model: model, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        let userResponse = data as! UserResponse
                        UserViewModel.body = userResponse
                        self.navigateToMenuUsuario()
                    }
                }
            })
        }
    }
    
    @objc func atualizarDados(_ sender: UIButton) {
        getData()
        guard let perfilModel = model else { return }

        do {
            let service = UpdatePerfilService()
            service.apiCall(model: perfilModel, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        self.callUser()
                    }
                }
            })
        }
    }
    
    func setupItens() {
        customView?.nameText.text = UserViewModel.body.name
        customView?.usernameText.text = UserViewModel.body.username
        customView?.emailText.text = UserViewModel.body.email
        customView?.phoneText.text = UserViewModel.body.phone
        customView?.passwordText.text = UserViewModel.body.password
    }
}
