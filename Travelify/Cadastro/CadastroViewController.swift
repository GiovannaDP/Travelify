//
//  CadastroViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class CadastroViewController: UIViewController {
    
    private var customView: CadastroScreenView? = nil
    private var model: CadastroModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: CadastroViewController())
        buildView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customView?.usernameText.text = ""
        customView?.passwordText.text = ""
        customView?.nameText.text = ""
        customView?.phoneText.text = ""
        customView?.emailText.text = ""
    }
    
    func buildView() {
        view = CadastroScreenView()
        customView = view as? CadastroScreenView
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }
    
    func routeToLogin() {
           self.navigationController?.popViewController(animated: true)
       }
    
    func getData() {
        guard let email = customView?.emailText.text, let name = customView?.nameText.text,  let phone = customView?.phoneText.text, let username = customView?.usernameText.text, let secureTextField = customView?.passwordText, let text = secureTextField.text else { return }
        let unmaskedString = NSString(string: text)
        model = CadastroModel(email: email, name: name, password: unmaskedString as String, phone: phone, username: username)
    }
    
    func checkTexts() -> Bool{
        if customView?.usernameText.text?.count == 11 || customView?.usernameText.text?.count == 14 {
            if customView?.nameText.text != "" && customView?.passwordText.text != "" {
                if customView?.phoneText.text != "" || customView?.emailText.text != "" {
                    return true
                }
                return false
            }
            return false
        }
        return false
    }

    @objc func cadastro(_ sender: UIButton) {
        if checkTexts() {
            self.getData()
            
            guard let model = model else { return }
            
            do {
                let service = CadastroService()
                service.apiCall(model: model, callback: { result in
                    DispatchQueue.main.async {
                        switch result {
                        case let .failure(error):
                            print(error)
                        case let .success(data):
                            print(data)
                            self.routeToLogin()
                        }
                    }
                })
            }
        } else {
            debugPrint("ERRO")
        }
    }
}

