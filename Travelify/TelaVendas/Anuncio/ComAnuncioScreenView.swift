//
//  ComAnuncioScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class ComAnuncioScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.init(red: 100/255, green: 169/255, blue: 233/255, alpha: 1.0)
        setupView()
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
        label.text = "Seus Anuncios"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
//    lazy var secondView: UIView = {
//        let view = UIView(frame: UIScreen.main.bounds)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()
//
//    lazy var semAnuncioLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.text = "Você não possui nenhuma venda"
//        label.font = UIFont(name: "IowanOldStyle-Bold", size: 25)
//        label.textColor = .black
//        return label
//    }()
//
//    lazy var imageView: UIImageView = {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentMode = .scaleAspectFit
//        view.image = UIImage(systemName: "exclamationmark.circle.fill")
//        view.tintColor = .lightGray
//        return view
//    }()
//
//    lazy var cadastroAnuncioButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Criar anúncio", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 20)
//        button.setTitleColor(.black, for: .normal)
//        return button
//    }()
    
        
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
//        mainView.addSubview(secondView)
        
//        secondView.addSubview(semAnuncioLabel)
//        secondView.addSubview(imageView)
//        secondView.addSubview(cadastroAnuncioButton)
//
//        cadastroAnuncioButton.underline()
    }

    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),
            
//            self.secondView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
//            self.secondView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
//            self.secondView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
//            self.secondView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
//
//            self.semAnuncioLabel.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 20),
//            self.semAnuncioLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor),
//            self.semAnuncioLabel.trailingAnchor.constraint(equalTo: secondView.trailingAnchor),
//
//            self.imageView.topAnchor.constraint(equalTo: semAnuncioLabel.bottomAnchor, constant: 80),
//            self.imageView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor),
//            self.imageView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor),
//            self.imageView.heightAnchor.constraint(equalToConstant: 120),
//
//            self.cadastroAnuncioButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor),
//            self.cadastroAnuncioButton.trailingAnchor.constraint(equalTo: secondView.trailingAnchor),
//            self.cadastroAnuncioButton.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: -20)
            
            ])
        }
}


