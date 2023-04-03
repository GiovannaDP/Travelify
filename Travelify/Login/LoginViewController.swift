//
//  LoginViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var customView: LoginScreenView? = nil
    private var model: LoginModel? = nil
    private var userResponse: UserResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customView?.usernameText.text = ""
        customView?.passwordText.text = ""
    }
    
    func buildView() {
        view = LoginScreenView()
        customView = view as? LoginScreenView
        customView?.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }
    
    func checkTexts() -> Bool {
        if customView?.usernameText.text?.count == 11 || customView?.usernameText.text?.count == 14 {
            return true
        }
        return false
    }
    
    func getData() {
        guard let secureTextField = customView?.passwordText, let text = secureTextField.text, let username = customView?.usernameText.text else { return }
            let unmaskedString = NSString(string: text)
        
        model = LoginModel(password: unmaskedString as String, username: username)
    }
    
    func navigateToApp(user: UserResponse) {
        if user.profileType == "CPF" {
            let pacotes = TelaInicialViewController()
            self.navigationController?.pushViewController(pacotes, animated: true)
        } else {
            let telaInicialVendas = SemAnuncioViewController()
            self.navigationController?.pushViewController(telaInicialVendas, animated: true)
        }
    }
    
    @objc func login(_ sender: UIButton){
        if checkTexts() {
            
            getData()
            
            guard let model = model else { return }
            
            debugPrint("login")
            do {
                let service = LoginService()
                service.apiCall(model: model, callback: { result in
                    DispatchQueue.main.async { [self] in
                        switch result {
                        case let .failure(error):
                            print(error)
                        case let .success(data):
                            userResponse = data as! UserResponse
                            guard let model = userResponse else { return }
                            UserViewModel.User(id: model.userId, username: model.username, name: model.name, profileType: model.profileType, email: model.email, phone: model.phone, hotels: model.hotels, flights: model.flights, packages: model.packages, messages: [UserViewModel.Messages(id: model.messages.first?.id ?? 0, message: model.messages.first?.message ?? "")], error: model.error)
                            navigateToApp(user: model)
                            print(data, model.name)
                        }
                    }
                })
            }
        } else {
            debugPrint("ERRO")
        }
    }
    
    @objc func cadastro(_ sender: UIButton){
        let vc = CadastroViewController()
        self.navigationController!.pushViewController(vc, animated: true)
    }
}

