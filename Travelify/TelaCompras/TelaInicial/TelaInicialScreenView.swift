//
//  TelaInicialScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class TelaInicialScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
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
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Travel"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .black
        return label
    }()
    
    lazy var headerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = UIColor(named: "backgroundColorDark")
        return view
    }()
    
    lazy var buttonPacotes: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pacotes", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(UIColor(named: "backgroundColor"), for: .selected)
       return button
    }()
    
    lazy var buttonVoos: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voos", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(UIColor(named: "backgroundColor"), for: .selected)
       return button
    }()
    
    lazy var buttonHoteis: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hoteis", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(UIColor(named: "backgroundColor"), for: .selected)
       return button
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        return table
    }()

    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(headerView)
        headerView.addSubview(buttonPacotes)
        headerView.addSubview(buttonVoos)
        headerView.addSubview(buttonHoteis)
        firstView.addSubview(tableView)
    }
    
    func setupItens() {
        buttonPacotes.isSelected = true
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.firstView.topAnchor, constant: 15),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            
            self.headerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.headerView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            
            self.buttonPacotes.topAnchor.constraint(equalTo: headerView.topAnchor),
            self.buttonPacotes.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            self.buttonPacotes.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            
            self.buttonVoos.topAnchor.constraint(equalTo: headerView.topAnchor),
            self.buttonVoos.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.buttonVoos.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            
            self.buttonHoteis.topAnchor.constraint(equalTo: headerView.topAnchor),
            self.buttonHoteis.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            self.buttonHoteis.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor),
            ])
        }
}
