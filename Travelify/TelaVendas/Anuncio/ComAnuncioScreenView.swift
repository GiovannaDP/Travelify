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
        backgroundColor = .white
        
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
        label.text = "Seus anuncios"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .black
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        return table
    }()
    
    lazy var cadastroAnuncioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar anúncio", for: .normal)
        button.titleLabel?.font = UIFont(name: "Kailasa-Bold", size: 20)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(tableView)
        firstView.addSubview(cadastroAnuncioButton)
        
        cadastroAnuncioButton.underline()
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.firstView.topAnchor, constant: 15),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.tableView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            
            self.cadastroAnuncioButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            self.cadastroAnuncioButton.heightAnchor.constraint(equalToConstant: 30),
            self.cadastroAnuncioButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            self.cadastroAnuncioButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            self.cadastroAnuncioButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -20),
            
            ])
        }
}
