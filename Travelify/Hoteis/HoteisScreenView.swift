//
//  HoteisScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class HoteisScreenView: UIView {
    
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
        label.text = "IBIS - Londres"
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
    
    lazy var notaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nota: 9.5"
        label.textColor = .black
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 16)
        return label
    }()
    
    lazy var precoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$100,00"
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
    
    lazy var cafeDaManhaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var cafeDaManhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Café da manhã"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var cafeDaManhaAirplane: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
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
    
    lazy var piscinaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var piscinaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Piscina"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var iconCafeDaManha: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "figure.pool.swim")
        view.tintColor = .black
        return view
    }()
    
    lazy var comprarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reservar Hotel", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 18)
        button.backgroundColor = UIColor(named: "backgroundColorDark")
        button.setTitleColor(.black, for: .normal)
        return button
    }()
        
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(imageView)
        firstView.addSubview(departureDateLabel)
        firstView.addSubview(returnDateLabel)
        firstView.addSubview(notaLabel)
        firstView.addSubview(precoLabel)
        firstView.addSubview(adicionalStack)
    
        adicionalStack.addArrangedSubview(cafeDaManhaView)
        adicionalStack.addArrangedSubview(wifiView)
        adicionalStack.addArrangedSubview(piscinaView)
        
        cafeDaManhaView.addSubview(cafeDaManhaLabel)
        cafeDaManhaView.addSubview(cafeDaManhaAirplane)

        wifiView.addSubview(wifiLabel)
        wifiView.addSubview(iconWifi)

        piscinaView.addSubview(piscinaLabel)
        piscinaView.addSubview(iconCafeDaManha)
        
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
            
            self.imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            self.imageView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10),
            self.imageView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -10),
            self.imageView.heightAnchor.constraint(equalToConstant: 250),
            
            self.departureDateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            self.departureDateLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            
            self.returnDateLabel.centerYAnchor.constraint(equalTo: departureDateLabel.centerYAnchor),
            self.returnDateLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.notaLabel.topAnchor.constraint(equalTo: departureDateLabel.bottomAnchor, constant: 15),
            self.notaLabel.leadingAnchor.constraint(equalTo: departureDateLabel.leadingAnchor),
            
            self.precoLabel.topAnchor.constraint(equalTo: returnDateLabel.bottomAnchor, constant: 15),
            self.precoLabel.trailingAnchor.constraint(equalTo: returnDateLabel.trailingAnchor),
            
            self.adicionalStack.topAnchor.constraint(equalTo: precoLabel.bottomAnchor, constant: 15),
            self.adicionalStack.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10),
            self.adicionalStack.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -10),
            self.adicionalStack.heightAnchor.constraint(equalToConstant: 110),
            
            self.cafeDaManhaAirplane.topAnchor.constraint(equalTo: cafeDaManhaView.topAnchor, constant: 15),
            self.cafeDaManhaAirplane.centerXAnchor.constraint(equalTo: cafeDaManhaView.centerXAnchor),
            self.cafeDaManhaAirplane.widthAnchor.constraint(equalToConstant: 50),
            self.cafeDaManhaAirplane.heightAnchor.constraint(equalToConstant: 50),
            
            self.cafeDaManhaLabel.topAnchor.constraint(equalTo: cafeDaManhaAirplane.bottomAnchor, constant: 10),
            self.cafeDaManhaLabel.centerXAnchor.constraint(equalTo: cafeDaManhaAirplane.centerXAnchor),
            
            self.iconWifi.topAnchor.constraint(equalTo: wifiView.topAnchor, constant: 15),
            self.iconWifi.centerXAnchor.constraint(equalTo: wifiView.centerXAnchor),
            self.iconWifi.widthAnchor.constraint(equalToConstant: 50),
            self.iconWifi.heightAnchor.constraint(equalToConstant: 50),
            
            self.wifiLabel.topAnchor.constraint(equalTo: iconWifi.bottomAnchor, constant: 10),
            self.wifiLabel.centerXAnchor.constraint(equalTo: iconWifi.centerXAnchor),

            self.iconCafeDaManha.topAnchor.constraint(equalTo: piscinaView.topAnchor, constant: 15),
            self.iconCafeDaManha.centerXAnchor.constraint(equalTo: piscinaView.centerXAnchor),
            self.iconCafeDaManha.widthAnchor.constraint(equalToConstant: 50),
            self.iconCafeDaManha.heightAnchor.constraint(equalToConstant: 50),
            
            self.piscinaLabel.topAnchor.constraint(equalTo: iconCafeDaManha.bottomAnchor, constant: 10),
            self.piscinaLabel.centerXAnchor.constraint(equalTo: iconCafeDaManha.centerXAnchor),
            
            self.comprarButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 60),
            self.comprarButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -60),
            self.comprarButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -15)
            ])
        }
}
