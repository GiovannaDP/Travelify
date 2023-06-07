//
//  VoosScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class VoosScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "backgroundColorDark")
        setupView()
        configuraConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Voo"
        label.numberOfLines = 2
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 28)
        label.textColor = .black
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "Londres-1")
        return view
    }()
    
    lazy var iconAirplane1: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "airplane")
        view.tintColor = .black
        return view
    }()
    
    lazy var tituloVooLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Londres"
        label.textAlignment = .center
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 23)
        return label
    }()
    
    lazy var origemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "São Paulo"
        label.textAlignment = .center
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 23)
        return label
    }()
    
    lazy var departureDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ida: 10/04/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 18)
        return label
    }()
    
    lazy var returnDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Volta: 25/04/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 18)
        return label
    }()
    
    lazy var vagasRestantesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vagas restantes: 10"
        label.textColor = .black
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 16)
        return label
    }()
    
    lazy var classeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classe: Econômica"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 16)
        return label
    }()
    
    lazy var precoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$5000,00"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 18)
        label.textColor = .orange
        return label
    }()
    
    lazy var adicionalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.backgroundColor = .white
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    lazy var companhiaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var companhiaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TAM"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var iconAirplane: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "airplane.circle.fill")
        view.tintColor = .black
        return view
    }()
    
    lazy var wifiView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var wifiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WIFI Grátis"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var iconWifi: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "wifi.circle.fill")
        view.tintColor = .black
        return view
    }()
    
    lazy var bagagemView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var bagagemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bagagem de 23Kg"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var iconBagagem: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "suitcase.fill")
        view.tintColor = .black
        return view
    }()
    
    lazy var comprarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Comprar Voo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = UIColor(named: "backgroundColorDark")
        button.setTitleColor(UIColor(named: "backgroundColor"), for: .normal)
        return button
    }()
        
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(imageView)
        firstView.addSubview(iconAirplane1)
        firstView.addSubview(tituloVooLabel)
        firstView.addSubview(origemLabel)
        firstView.addSubview(departureDateLabel)
        firstView.addSubview(returnDateLabel)
        firstView.addSubview(vagasRestantesLabel)
        firstView.addSubview(classeLabel)
        firstView.addSubview(precoLabel)
        firstView.addSubview(adicionalStack)
    
        adicionalStack.addArrangedSubview(companhiaView)
        adicionalStack.addArrangedSubview(wifiView)
        adicionalStack.addArrangedSubview(bagagemView)
        
        companhiaView.addSubview(companhiaLabel)
        companhiaView.addSubview(iconAirplane)

        wifiView.addSubview(wifiLabel)
        wifiView.addSubview(iconWifi)

        bagagemView.addSubview(bagagemLabel)
        bagagemView.addSubview(iconBagagem)
        
        firstView.addSubview(comprarButton)
        
        comprarButton.addCorner()
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            self.imageView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10),
            self.imageView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -10),
            self.imageView.heightAnchor.constraint(equalToConstant: 250),
            
            self.iconAirplane1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            self.iconAirplane1.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            self.iconAirplane1.widthAnchor.constraint(equalToConstant: 20),
            self.iconAirplane1.heightAnchor.constraint(equalToConstant: 20),
            
            self.origemLabel.centerYAnchor.constraint(equalTo: iconAirplane1.centerYAnchor),
            self.origemLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.origemLabel.trailingAnchor.constraint(equalTo: firstView.centerXAnchor, constant: -30),
            
            self.tituloVooLabel.centerYAnchor.constraint(equalTo: iconAirplane1.centerYAnchor),
            self.tituloVooLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            self.tituloVooLabel.leadingAnchor.constraint(equalTo: firstView.centerXAnchor, constant: 30),
            
            self.departureDateLabel.topAnchor.constraint(equalTo: origemLabel.bottomAnchor, constant: 15),
            self.departureDateLabel.centerXAnchor.constraint(equalTo: origemLabel.centerXAnchor),
            
            self.returnDateLabel.centerYAnchor.constraint(equalTo: departureDateLabel.centerYAnchor),
            self.returnDateLabel.centerXAnchor.constraint(equalTo: tituloVooLabel.centerXAnchor),
            
            self.vagasRestantesLabel.topAnchor.constraint(equalTo: departureDateLabel.bottomAnchor, constant: 15),
            self.vagasRestantesLabel.centerXAnchor.constraint(equalTo: departureDateLabel.centerXAnchor),
            
            self.classeLabel.centerYAnchor.constraint(equalTo: vagasRestantesLabel.centerYAnchor),
            self.classeLabel.centerXAnchor.constraint(equalTo: returnDateLabel.centerXAnchor),
            
            self.precoLabel.topAnchor.constraint(equalTo: classeLabel.bottomAnchor, constant: 15),
            self.precoLabel.centerXAnchor.constraint(equalTo: classeLabel.centerXAnchor),
            
            self.adicionalStack.topAnchor.constraint(equalTo: precoLabel.bottomAnchor, constant: 15),
            self.adicionalStack.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10),
            self.adicionalStack.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -10),
            self.adicionalStack.heightAnchor.constraint(equalToConstant: 110),
            
            self.iconAirplane.topAnchor.constraint(equalTo: companhiaView.topAnchor, constant: 15),
            self.iconAirplane.centerXAnchor.constraint(equalTo: companhiaView.centerXAnchor),
            self.iconAirplane.widthAnchor.constraint(equalToConstant: 50),
            self.iconAirplane.heightAnchor.constraint(equalToConstant: 50),
            
            self.companhiaLabel.topAnchor.constraint(equalTo: iconAirplane.bottomAnchor, constant: 10),
            self.companhiaLabel.centerXAnchor.constraint(equalTo: iconAirplane.centerXAnchor),
            
            self.iconWifi.topAnchor.constraint(equalTo: wifiView.topAnchor, constant: 15),
            self.iconWifi.centerXAnchor.constraint(equalTo: wifiView.centerXAnchor),
            self.iconWifi.widthAnchor.constraint(equalToConstant: 50),
            self.iconWifi.heightAnchor.constraint(equalToConstant: 50),
            
            self.wifiLabel.topAnchor.constraint(equalTo: iconWifi.bottomAnchor, constant: 10),
            self.wifiLabel.centerXAnchor.constraint(equalTo: iconWifi.centerXAnchor),

            self.iconBagagem.topAnchor.constraint(equalTo: bagagemView.topAnchor, constant: 15),
            self.iconBagagem.centerXAnchor.constraint(equalTo: bagagemView.centerXAnchor),
            self.iconBagagem.widthAnchor.constraint(equalToConstant: 50),
            self.iconBagagem.heightAnchor.constraint(equalToConstant: 50),
            
            self.bagagemLabel.topAnchor.constraint(equalTo: iconBagagem.bottomAnchor, constant: 10),
            self.bagagemLabel.centerXAnchor.constraint(equalTo: iconBagagem.centerXAnchor),
        
            self.comprarButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 60),
            self.comprarButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -60),
            self.comprarButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -15)
            ])
        }
}
