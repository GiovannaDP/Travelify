//
//  TelaConfirmacaoScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class TelaConfirmacaoScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.init(red: 100/255, green: 169/255, blue: 233/255, alpha: 1.0)
        setupView()
        setRounded()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var mainView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Confirme os dados"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .black
        return label
    }()
    
    
    lazy var nomeCompletoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome Completo"
        label.font = UIFont(name: "Kailasa-Bold", size: 16)
        return label
    }()
    
    lazy var nomeCompletoText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor(named: "textComponent")
        text.isEnabled = false
        return text
    }()
    
    lazy var cpfLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CPF"
        label.font = UIFont(name: "Kailasa-Bold", size: 16)
        return label
    }()
    
    lazy var cpfText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor(named: "textComponent")
        text.isEnabled = false
        return text
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont(name: "Kailasa-Bold", size: 16)
        return label
    }()
    
    lazy var emailText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor(named: "textComponent")
        text.isEnabled = false
        return text
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Telefone"
        label.font = UIFont(name: "Kailasa-Bold", size: 16)
        return label
    }()
    
    lazy var phoneText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor(named: "textComponent")
        text.isEnabled = false
        return text
    }()
    
    lazy var datasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Datas do voo"
        label.font = UIFont(name: "Kailasa-Bold", size: 16)
        return label
    }()
    
    lazy var datasText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor(named: "textComponent")
        text.isEnabled = false
        return text
    }()
    
    lazy var origemDestinoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Voo"
        label.font = UIFont(name: "Kailasa-Bold", size: 16)
        return label
    }()
    
    lazy var origemDestinoText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor(named: "textComponent")
        text.isEnabled = false
        return text
    }()
    
    lazy var classeDoVooLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Economica"
        label.font = UIFont(name: "Kailasa-Bold", size: 16)
        return label
    }()
    
    lazy var classeDoVooText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor(named: "textComponent")
        text.isEnabled = false
        return text
    }()
    
    lazy var confirmarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = UIColor(named: "textComponent")
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var escolherOutroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Escolher outro voo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = UIColor(named: "textComponent")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        return button
    }()
        
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(nomeCompletoLabel)
        mainView.addSubview(nomeCompletoText)
        mainView.addSubview(cpfLabel)
        mainView.addSubview(cpfText)
        mainView.addSubview(emailLabel)
        mainView.addSubview(emailText)
        mainView.addSubview(phoneLabel)
        mainView.addSubview(phoneText)
        mainView.addSubview(datasLabel)
        mainView.addSubview(datasText)
        mainView.addSubview(origemDestinoLabel)
        mainView.addSubview(origemDestinoText)
        mainView.addSubview(classeDoVooLabel)
        mainView.addSubview(classeDoVooText)
        mainView.addSubview(escolherOutroButton)
        mainView.addSubview(confirmarButton)
    }
    
    func setRounded() {
        nomeCompletoText.layer.cornerRadius = 8
        cpfText.layer.cornerRadius = 8
        emailText.layer.cornerRadius = 8
        phoneText.layer.cornerRadius = 8
        datasText.layer.cornerRadius = 8
        origemDestinoText.layer.cornerRadius = 8
        classeDoVooText.layer.cornerRadius = 8
        escolherOutroButton.addCorner()
        confirmarButton.addCorner()
    }

    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),
            
            self.nomeCompletoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            self.nomeCompletoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.nomeCompletoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.nomeCompletoText.topAnchor.constraint(equalTo: nomeCompletoLabel.bottomAnchor, constant: 1),
            self.nomeCompletoText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.nomeCompletoText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.cpfLabel.topAnchor.constraint(equalTo: nomeCompletoText.bottomAnchor, constant: 15),
            self.cpfLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.cpfLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.cpfText.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 1),
            self.cpfText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.cpfText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.emailLabel.topAnchor.constraint(equalTo: cpfText.bottomAnchor, constant: 15),
            self.emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.emailText.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 1),
            self.emailText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.emailText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.phoneLabel.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 15),
            self.phoneLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.phoneLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.phoneText.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 1),
            self.phoneText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.phoneText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.datasLabel.topAnchor.constraint(equalTo: phoneText.bottomAnchor, constant: 15),
            self.datasLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.datasLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.datasText.topAnchor.constraint(equalTo: datasLabel.bottomAnchor, constant: 1),
            self.datasText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.datasText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.origemDestinoLabel.topAnchor.constraint(equalTo: datasText.bottomAnchor, constant: 15),
            self.origemDestinoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.origemDestinoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.origemDestinoText.topAnchor.constraint(equalTo: origemDestinoLabel.bottomAnchor, constant: 1),
            self.origemDestinoText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.origemDestinoText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.classeDoVooLabel.topAnchor.constraint(equalTo: origemDestinoText.bottomAnchor, constant: 15),
            self.classeDoVooLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.classeDoVooLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.classeDoVooText.topAnchor.constraint(equalTo: classeDoVooLabel.bottomAnchor, constant: 1),
            self.classeDoVooText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.classeDoVooText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.escolherOutroButton.heightAnchor.constraint(equalToConstant: 50),
            self.escolherOutroButton.widthAnchor.constraint(equalToConstant: 150),
            self.escolherOutroButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.escolherOutroButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            self.confirmarButton.heightAnchor.constraint(equalToConstant: 50),
            self.confirmarButton.widthAnchor.constraint(equalToConstant: 150),
            self.confirmarButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.confirmarButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
        ])
        }
}


