//
//  DadosUsuarioScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//


import Foundation
import UIKit

class DadosUsuarioScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "backgroundColorDark")
        setupView()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var mainView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "backgroundColorDark")
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Seus Dados"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var fotoUsuarioImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = .black
        return image
    }()
    
    lazy var nomeUsuarioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "nome"
        label.font = UIFont(name: "Kailasa-Bold", size: 25)
        label.textColor = .white
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        return table
    }()
        
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(fotoUsuarioImageView)
        mainView.addSubview(nomeUsuarioLabel)
        mainView.addSubview(tableView)
    }

    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),
            
            self.fotoUsuarioImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.fotoUsuarioImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.fotoUsuarioImageView.widthAnchor.constraint(equalToConstant: 60),
            self.fotoUsuarioImageView.heightAnchor.constraint(equalToConstant: 60),
            
            self.nomeUsuarioLabel.centerYAnchor.constraint(equalTo: fotoUsuarioImageView.centerYAnchor, constant: 3),
            self.nomeUsuarioLabel.leadingAnchor.constraint(equalTo: fotoUsuarioImageView.trailingAnchor, constant: 10),
            
            self.tableView.topAnchor.constraint(equalTo: nomeUsuarioLabel.bottomAnchor, constant: 20),
            self.tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            ])
        }
}
