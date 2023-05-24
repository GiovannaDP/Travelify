//
//  SuasComprasScreenViewCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 22/05/23.
//

import Foundation
import UIKit

class SuasComprasScreenViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        setupView()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var mainView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var mainIconeView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = .black
        return image
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Suas vendas"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 24)
        return label
    }()
    
    lazy var departureDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10/10/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 18)
        return label
    }()
    
    lazy var returnDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "30/10/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 18)
        return label
    }()
    
    func configuraInfo(icon: String, title: String, departureDate: String, returnDate: String) {
        mainIconeView.image = UIImage(systemName: icon)
        mainLabel.text = title
        departureDateLabel.text = departureDate
        returnDateLabel.text = returnDate
    }
    
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(mainIconeView)
        mainView.addSubview(mainLabel)
        mainView.addSubview(departureDateLabel)
        mainView.addSubview(returnDateLabel)
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),

            self.mainIconeView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            self.mainIconeView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.mainIconeView.widthAnchor.constraint(equalToConstant: 35),
            self.mainIconeView.heightAnchor.constraint(equalToConstant: 35),
            
            self.mainLabel.centerYAnchor.constraint(equalTo: mainIconeView.centerYAnchor),
            self.mainLabel.leadingAnchor.constraint(equalTo: mainIconeView.trailingAnchor, constant: 10),
            self.mainLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            self.departureDateLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            self.departureDateLabel.leadingAnchor.constraint(equalTo: mainIconeView.trailingAnchor, constant: 10),
            
            self.returnDateLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            self.returnDateLabel.leadingAnchor.constraint(equalTo: departureDateLabel.trailingAnchor, constant: 10),
            self.returnDateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10)
            ])
        }
}
