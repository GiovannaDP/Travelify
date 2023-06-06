//
//  CriacaoPacoteScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 05/06/23.
//

import Foundation
import UIKit
import iOSDropDown

class CriacaoPacoteScreenView: UIView {
    
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
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Criação de Pacote"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var nomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Pacote"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var nomeText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var departureDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data de saída"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var departureDateText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var returnDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data de retorno"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var returnDateText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Origem"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var originText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var destinyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Destino"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var destinyText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preço"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var priceText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome da imagem principal"
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var imageText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var dropDownHotel: DropDown = {
        let view = DropDown()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dropDownVoo: DropDown = {
        let view = DropDown()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(destinyLabel)
        scrollView.addSubview(destinyText)
        scrollView.addSubview(nomeLabel)
        scrollView.addSubview(nomeText)
        scrollView.addSubview(departureDateLabel)
        scrollView.addSubview(departureDateText)
        scrollView.addSubview(originLabel)
        scrollView.addSubview(originText)
        scrollView.addSubview(returnDateLabel)
        scrollView.addSubview(returnDateText)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(priceText)
        scrollView.addSubview(imageLabel)
        scrollView.addSubview(imageText)
        scrollView.addSubview(dropDownHotel)
        scrollView.addSubview(dropDownVoo)
        scrollView.addSubview(cadastroButton)
    }
    
    func setupItens() {
        destinyText.layer.cornerRadius = 8
        nomeText.layer.cornerRadius = 8
        departureDateText.layer.cornerRadius = 8
        originText.layer.cornerRadius = 8
        returnDateText.layer.cornerRadius = 8
        priceText.layer.cornerRadius = 8
        imageText.layer.cornerRadius = 8
        cadastroButton.layer.cornerRadius = 15
    }
    
    func configuraConstraints(){
        
        let height = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
        
        NSLayoutConstraint.activate([

            self.scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: height),

            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.nomeLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 60),
            self.nomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.nomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.nomeText.topAnchor.constraint(equalTo: self.nomeLabel.topAnchor, constant: 25),
            self.nomeText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.nomeText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.originLabel.topAnchor.constraint(equalTo: self.nomeText.topAnchor, constant: 40),
            self.originLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.originLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.originText.topAnchor.constraint(equalTo: self.originLabel.topAnchor, constant: 25),
            self.originText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.originText.widthAnchor.constraint(equalToConstant: 60),
            self.originText.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.destinyLabel.centerYAnchor.constraint(equalTo: self.originLabel.centerYAnchor),
            self.destinyLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.destinyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.destinyText.topAnchor.constraint(equalTo: self.destinyLabel.topAnchor, constant: 25),
            self.destinyText.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.destinyText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.destinyText.widthAnchor.constraint(equalToConstant: 60),
            
            self.departureDateLabel.topAnchor.constraint(equalTo: self.originText.topAnchor, constant: 40),
            self.departureDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.departureDateLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.departureDateText.topAnchor.constraint(equalTo: self.departureDateLabel.topAnchor, constant: 25),
            self.departureDateText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.departureDateText.widthAnchor.constraint(equalToConstant: 60),
            self.departureDateText.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.returnDateLabel.centerYAnchor.constraint(equalTo: self.departureDateLabel.centerYAnchor),
            self.returnDateLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.returnDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.returnDateText.topAnchor.constraint(equalTo: self.returnDateLabel.topAnchor, constant: 25),
            self.returnDateText.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.returnDateText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.returnDateText.widthAnchor.constraint(equalToConstant: 60),

            self.priceLabel.topAnchor.constraint(equalTo: self.departureDateText.topAnchor, constant: 25),
            self.priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.priceLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.priceText.topAnchor.constraint(equalTo: self.priceLabel.topAnchor, constant: 25),
            self.priceText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.priceText.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            self.priceText.widthAnchor.constraint(equalToConstant: 60),

            self.imageLabel.topAnchor.constraint(equalTo: self.priceText.topAnchor, constant: 40),
            self.imageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.imageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.imageText.topAnchor.constraint(equalTo: self.imageLabel.topAnchor, constant: 25),
            self.imageText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.imageText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.dropDownHotel.topAnchor.constraint(equalTo: self.imageText.bottomAnchor, constant: 25),
            self.dropDownHotel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.dropDownHotel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.dropDownVoo.topAnchor.constraint(equalTo: self.dropDownHotel.bottomAnchor, constant: 25),
            self.dropDownVoo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.dropDownVoo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.cadastroButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            self.cadastroButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            self.cadastroButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
            ])
        }
}

