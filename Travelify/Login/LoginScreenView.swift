//
//  LoginScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class LoginScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.init(red: 100/255, green: 169/255, blue: 233/255, alpha: 1.0)
        setupView()
        setupItens()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 100/255, green: 169/255, blue: 233/255, alpha: 1.0)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Travelify"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var usernameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.keyboardType = .numberPad
        return text
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var passwordText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.isSecureTextEntry = true
        return text
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var cadastroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Ainda não é cadastrado?"
        label.textColor = .white
        return label
    }()
    
    lazy var cadastroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fazer cadastro", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(usernameLabel)
        firstView.addSubview(usernameText)
        firstView.addSubview(passwordLabel)
        firstView.addSubview(passwordText)
        firstView.addSubview(loginButton)
        firstView.addSubview(cadastroLabel)
        firstView.addSubview(cadastroButton)
    }
    
    func setupItens() {
        usernameText.layer.cornerRadius = 8
        passwordText.layer.cornerRadius = 8
        loginButton.layer.cornerRadius = 15
        cadastroButton.underline()
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            
            self.usernameLabel.topAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: 100),
            self.usernameLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.usernameLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.usernameText.topAnchor.constraint(equalTo: self.usernameLabel.topAnchor, constant: 25),
            self.usernameText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.usernameText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            self.usernameText.heightAnchor.constraint(equalToConstant: 30),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.usernameText.topAnchor, constant: 40),
            self.passwordLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.passwordLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.passwordText.topAnchor.constraint(equalTo: self.passwordLabel.topAnchor, constant: 25),
            self.passwordText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.passwordText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            self.passwordText.heightAnchor.constraint(equalToConstant: 30),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordText.topAnchor, constant: 60),
            self.loginButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 100),
            self.loginButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -100),
            
            self.cadastroLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.cadastroLabel.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -50),
            
            self.cadastroButton.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.cadastroButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -25)
            ])
        }
}

