//
//  PacotesScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class PacotesScreenView: UIView {
    
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
        label.text = "Pacote - Londres"
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
    
    lazy var hotelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "IBIS"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 23)
        return label
    }()
    
    lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ITA AIRWAYS"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 23)
        return label
    }()
    
    lazy var comprarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Comprar Pacote", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = UIColor(named: "backgroundColorDark")
        button.setTitleColor(.black, for: .normal)
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
        firstView.addSubview(hotelLabel)
        firstView.addSubview(companyLabel)
        
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
            
            self.hotelLabel.topAnchor.constraint(equalTo: origemLabel.bottomAnchor, constant: 15),
            self.hotelLabel.centerXAnchor.constraint(equalTo: origemLabel.centerXAnchor),
            
            self.companyLabel.centerYAnchor.constraint(equalTo: hotelLabel.centerYAnchor),
            self.companyLabel.centerXAnchor.constraint(equalTo: tituloVooLabel.centerXAnchor),
            
            self.departureDateLabel.topAnchor.constraint(equalTo: hotelLabel.bottomAnchor, constant: 15),
            self.departureDateLabel.centerXAnchor.constraint(equalTo: origemLabel.centerXAnchor),
            
            self.returnDateLabel.centerYAnchor.constraint(equalTo: departureDateLabel.centerYAnchor),
            self.returnDateLabel.centerXAnchor.constraint(equalTo: tituloVooLabel.centerXAnchor),
            
            self.vagasRestantesLabel.topAnchor.constraint(equalTo: departureDateLabel.bottomAnchor, constant: 15),
            self.vagasRestantesLabel.centerXAnchor.constraint(equalTo: departureDateLabel.centerXAnchor),
            
            self.classeLabel.centerYAnchor.constraint(equalTo: vagasRestantesLabel.centerYAnchor),
            self.classeLabel.centerXAnchor.constraint(equalTo: returnDateLabel.centerXAnchor),
            
            self.precoLabel.topAnchor.constraint(equalTo: classeLabel.bottomAnchor, constant: 15),
            self.precoLabel.centerXAnchor.constraint(equalTo: classeLabel.centerXAnchor),
            
            self.comprarButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 60),
            self.comprarButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -60),
            self.comprarButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -15)
            ])
        }
}

