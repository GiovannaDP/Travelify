//
//  EscolhaTipoCriacaoScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/04/23.
//

import Foundation
import UIKit

class EscolhaTipoCriacaoScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "backgroundColorDark")
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
        view.backgroundColor = UIColor(named: "backgroundColorDark")
        return view
    }()
    
    lazy var chooseType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Escolha qual categoria deseja criar"
        label.numberOfLines = 2
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var criarVooButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Voo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var criarHotelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Hotel", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var criarPacoteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Pacote", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(chooseType)
        firstView.addSubview(criarVooButton)
        firstView.addSubview(criarHotelButton)
        firstView.addSubview(criarPacoteButton)
    }
    
    func setupItens() {
        criarVooButton.layer.cornerRadius = 15
        criarHotelButton.layer.cornerRadius = 15
        criarPacoteButton.layer.cornerRadius = 15
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.chooseType.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.chooseType.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.chooseType.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor, constant: 30),
            self.chooseType.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: -30),
            
            self.criarVooButton.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.criarVooButton.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor, constant: 30),
            self.criarVooButton.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: -30),
            self.criarVooButton.centerYAnchor.constraint(equalTo: self.firstView.centerYAnchor, constant: -50),
            
            self.criarHotelButton.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.criarHotelButton.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor, constant: 30),
            self.criarHotelButton.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: -30),
            self.criarHotelButton.centerYAnchor.constraint(equalTo: self.firstView.centerYAnchor),
            
            self.criarPacoteButton.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.criarPacoteButton.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor, constant: 30),
            self.criarPacoteButton.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: -30),
            self.criarPacoteButton.centerYAnchor.constraint(equalTo: self.firstView.centerYAnchor, constant: 50)
            ])
        }
}
