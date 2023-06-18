//
//  MensagensVendedorScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class MensagensVendedorScreenView: UIView {
    
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
        label.text = "Suas Mensagens"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var semAnuncioView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var semAnuncioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Você não possui nenhuma mensagem"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "exclamationmark.circle.fill")
        view.tintColor = .lightGray
        return view
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.isHidden = true
        return table
    }()
        
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(tableView)
        
        mainView.addSubview(semAnuncioView)
        semAnuncioView.addSubview(semAnuncioLabel)
        semAnuncioView.addSubview(imageView)
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),
   
            self.tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            self.semAnuncioView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.semAnuncioView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            self.semAnuncioView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            self.semAnuncioView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            self.semAnuncioLabel.centerXAnchor.constraint(equalTo: semAnuncioView.centerXAnchor),
            self.semAnuncioLabel.centerYAnchor.constraint(equalTo: semAnuncioView.centerYAnchor, constant: -100),
            
            self.imageView.topAnchor.constraint(equalTo: semAnuncioLabel.bottomAnchor, constant: 10),
            self.imageView.leadingAnchor.constraint(equalTo: semAnuncioView.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: semAnuncioView.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 120)
            ])
        }
}
