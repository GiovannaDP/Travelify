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
        //        backgroundColor = UIColor.init(red: 100/255, green: 169/255, blue: 233/255, alpha: 1.0)
        setupView()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var contentView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.tintColor = .black
        return button
    }()

    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.tintColor = .black
        return button
    }()
    
    func setupView() {
        addSubview(contentView)
        contentView.addSubview(confirmButton)
        contentView.addSubview(cancelButton)
    }
    
    func configuraConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 300),
            contentView.heightAnchor.constraint(equalToConstant: 150),
            
            confirmButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            confirmButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            cancelButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            cancelButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}

