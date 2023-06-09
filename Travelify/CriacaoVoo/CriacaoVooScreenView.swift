//
//  CriacaoVooScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 03/04/23.
//

import Foundation
import UIKit

class CriacaoVooScreenView: UIView {
    
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
        label.text = "Criação de Voo"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var nomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Voo"
        label.textColor = UIColor(named: "backgroundColor")
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
        label.textColor = UIColor(named: "backgroundColor")
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
        label.textColor = UIColor(named: "backgroundColor")
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
        label.textColor = UIColor(named: "backgroundColor")
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
        label.textColor = UIColor(named: "backgroundColor")
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
        label.textColor = UIColor(named: "backgroundColor")
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var priceText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var vacanciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vagas"
        label.textColor = UIColor(named: "backgroundColor")
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var vacanciesText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var classTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classe do voo"
        label.textColor = UIColor(named: "backgroundColor")
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var classTypeText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var airlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Companhia aérea"
        label.textColor = UIColor(named: "backgroundColor")
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var airlineText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome da imagem principal"
        label.textColor = UIColor(named: "backgroundColor")
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        return label
    }()
    
    lazy var imageText: UITextField = {
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
        scrollView.addSubview(vacanciesLabel)
        scrollView.addSubview(vacanciesText)
        scrollView.addSubview(classTypeLabel)
        scrollView.addSubview(classTypeText)
        scrollView.addSubview(airlineLabel)
        scrollView.addSubview(airlineText)
        scrollView.addSubview(imageLabel)
        scrollView.addSubview(imageText)
        scrollView.addSubview(cadastroButton)
    }
    
    func setupItens() {
        destinyText.layer.cornerRadius = 8
        nomeText.layer.cornerRadius = 8
        departureDateText.layer.cornerRadius = 8
        originText.layer.cornerRadius = 8
        returnDateText.layer.cornerRadius = 8
        priceText.layer.cornerRadius = 8
        vacanciesText.layer.cornerRadius = 8
        classTypeText.layer.cornerRadius = 8
        airlineText.layer.cornerRadius = 8
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

            self.vacanciesLabel.topAnchor.constraint(equalTo: self.departureDateText.topAnchor, constant: 40),
            self.vacanciesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.vacanciesLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.vacanciesText.topAnchor.constraint(equalTo: self.vacanciesLabel.topAnchor, constant: 25),
            self.vacanciesText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.vacanciesText.widthAnchor.constraint(equalToConstant: 60),
            self.vacanciesText.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.priceLabel.centerYAnchor.constraint(equalTo: self.vacanciesLabel.centerYAnchor),
            self.priceLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.priceText.topAnchor.constraint(equalTo: self.priceLabel.topAnchor, constant: 25),
            self.priceText.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.priceText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.priceText.widthAnchor.constraint(equalToConstant: 60),
            
            self.classTypeLabel.topAnchor.constraint(equalTo: self.vacanciesText.topAnchor, constant: 40),
            self.classTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.classTypeLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.classTypeText.topAnchor.constraint(equalTo: self.classTypeLabel.topAnchor, constant: 25),
            self.classTypeText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.classTypeText.widthAnchor.constraint(equalToConstant: 60),
            self.classTypeText.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            self.airlineLabel.centerYAnchor.constraint(equalTo: self.classTypeLabel.centerYAnchor),
            self.airlineLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.airlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.airlineText.topAnchor.constraint(equalTo: self.airlineLabel.topAnchor, constant: 25),
            self.airlineText.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            self.airlineText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.airlineText.widthAnchor.constraint(equalToConstant: 60),
            
            self.imageLabel.topAnchor.constraint(equalTo: self.airlineText.topAnchor, constant: 40),
            self.imageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.imageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.imageText.topAnchor.constraint(equalTo: self.imageLabel.topAnchor, constant: 25),
            self.imageText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.imageText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.cadastroButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            self.cadastroButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            self.cadastroButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
            ])
        }
}
