//
//  SuasComprasScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 08/05/23.
//

import Foundation
import UIKit

class SuasComprasScreenView: UIView {
    
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
        label.text = "Suas Compras"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
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
   
            self.tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            ])
        }
}
