//
//  PopupScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 02/04/23.
//

import Foundation
import UIKit

class PopupScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupView()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "backgroungColor")
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tem certeza?"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Kailasa-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(contentView)
        contentView.addSubview(confirmButton)
        contentView.addSubview(cancelButton)
        contentView.addSubview(titleLabel)
        contentView.layer.cornerRadius = 30
    }
    
    func configuraConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 300),
            contentView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            confirmButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20),
            confirmButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            cancelButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            cancelButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
