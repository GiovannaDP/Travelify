//
//  PerfilVendedorScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 25/04/23.
//

import Foundation
import UIKit

class PerfilVendedorScreenView: UIView {
    
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
    
    lazy var mainView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 100/255, green: 169/255, blue: 233/255, alpha: 1.0)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Seus Dados"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var nameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CNPJ"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var usernameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var emailText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Telefone"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var phoneText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var passwordText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()

    
    lazy var editarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Atualizar dados", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(nameLabel)
        mainView.addSubview(nameText)
        mainView.addSubview(usernameLabel)
        mainView.addSubview(usernameText)
        mainView.addSubview(emailLabel)
        mainView.addSubview(emailText)
        mainView.addSubview(phoneLabel)
        mainView.addSubview(phoneText)
        mainView.addSubview(passwordLabel)
        mainView.addSubview(passwordText)
        mainView.addSubview(editarButton)
    }
    
    func setupItens() {
        usernameText.layer.cornerRadius = 8
        emailText.layer.cornerRadius = 8
        nameText.layer.cornerRadius = 8
        phoneText.layer.cornerRadius = 8
        passwordText.layer.cornerRadius = 8
        editarButton.layer.cornerRadius = 15
    }

    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),

            self.nameLabel.topAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: 100),
            self.nameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            self.nameText.topAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: 25),
            self.nameText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.nameText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            self.nameText.heightAnchor.constraint(equalToConstant: 30),
            
            self.usernameLabel.topAnchor.constraint(equalTo: self.nameText.topAnchor, constant: 40),
            self.usernameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.usernameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            self.usernameText.topAnchor.constraint(equalTo: self.usernameLabel.topAnchor, constant: 25),
            self.usernameText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.usernameText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            self.usernameText.heightAnchor.constraint(equalToConstant: 30),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.usernameText.topAnchor, constant: 40),
            self.emailLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            self.emailText.topAnchor.constraint(equalTo: self.emailLabel.topAnchor, constant: 25),
            self.emailText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.emailText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            self.emailText.heightAnchor.constraint(equalToConstant: 30),
            
            self.phoneLabel.topAnchor.constraint(equalTo: self.emailText.topAnchor, constant: 40),
            self.phoneLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.phoneLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            self.phoneText.topAnchor.constraint(equalTo: self.phoneLabel.topAnchor, constant: 25),
            self.phoneText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.phoneText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            self.phoneText.heightAnchor.constraint(equalToConstant: 30),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.phoneText.topAnchor, constant: 40),
            self.passwordLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.passwordLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            self.passwordText.topAnchor.constraint(equalTo: self.passwordLabel.topAnchor, constant: 25),
            self.passwordText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.passwordText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            self.passwordText.heightAnchor.constraint(equalToConstant: 30),
            
            self.editarButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 100),
            self.editarButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -100),
            self.editarButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -25)
            ])
        }
}
