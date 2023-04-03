//
//  DadosUsuarioScreenViewCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class DadosUsuarioScreenViewCell: UITableViewCell {
    
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
    
    lazy var mainImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = .black
        return image
    }()
    
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Seus favoritos"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 16)
        return label
    }()
    
    func configuraInfo(icon: String, info: String) {
        mainImageView.image = UIImage(systemName: icon)
        mainLabel.text = info
    }
    
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(mainImageView)
        mainView.addSubview(mainLabel)
    }
    
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),

            self.mainImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            self.mainImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.mainImageView.widthAnchor.constraint(equalToConstant: 35),
            self.mainImageView.heightAnchor.constraint(equalToConstant: 35),
            
            self.mainLabel.centerYAnchor.constraint(equalTo: mainImageView.centerYAnchor),
            self.mainLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10),
            self.mainLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
            ])
        }
}

