//
//  CadastroScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//


import Foundation
import UIKit

class CadastroScreenView: UIView {
    
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
        label.text = "Cadastro"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
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
        text.isSecureTextEntry = true
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
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CPF ou CNPJ"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var usernameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var cadastroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(usernameLabel)
        firstView.addSubview(usernameText)
        firstView.addSubview(emailLabel)
        firstView.addSubview(emailText)
        firstView.addSubview(nameLabel)
        firstView.addSubview(nameText)
        firstView.addSubview(phoneLabel)
        firstView.addSubview(phoneText)
        firstView.addSubview(passwordLabel)
        firstView.addSubview(passwordText)
        firstView.addSubview(cadastroButton)
    }
    
    func setupItens() {
        usernameText.layer.cornerRadius = 8
        emailText.layer.cornerRadius = 8
        nameText.layer.cornerRadius = 8
        phoneText.layer.cornerRadius = 8
        passwordText.layer.cornerRadius = 8
        cadastroButton.layer.cornerRadius = 15
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
            
            self.nameLabel.topAnchor.constraint(equalTo: self.usernameText.topAnchor, constant: 40),
            self.nameLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.nameText.topAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: 25),
            self.nameText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.nameText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            self.nameText.heightAnchor.constraint(equalToConstant: 30),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.nameText.topAnchor, constant: 40),
            self.emailLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.emailText.topAnchor.constraint(equalTo: self.emailLabel.topAnchor, constant: 25),
            self.emailText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.emailText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            self.emailText.heightAnchor.constraint(equalToConstant: 30),
            
            self.phoneLabel.topAnchor.constraint(equalTo: self.emailText.topAnchor, constant: 40),
            self.phoneLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.phoneLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.phoneText.topAnchor.constraint(equalTo: self.phoneLabel.topAnchor, constant: 25),
            self.phoneText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.phoneText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            self.phoneText.heightAnchor.constraint(equalToConstant: 30),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.phoneText.topAnchor, constant: 40),
            self.passwordLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.passwordLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.passwordText.topAnchor.constraint(equalTo: self.passwordLabel.topAnchor, constant: 25),
            self.passwordText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.passwordText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            self.passwordText.heightAnchor.constraint(equalToConstant: 30),
            
            self.cadastroButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 100),
            self.cadastroButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -100),
            self.cadastroButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -25)
            ])
        }
}

