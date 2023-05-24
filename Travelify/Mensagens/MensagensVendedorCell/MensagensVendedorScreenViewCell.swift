//
//  MensagensVendedorScreenViewCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/05/23.
//

import Foundation
import UIKit

class MensagensVendedorScreenViewCell: UITableViewCell {
    
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
        image.image = UIImage(systemName: "message.circle.fill")
        image.tintColor = .black
        return image
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 18)
        label.numberOfLines = 2
        return label
    }()

    
    func configuraInfo(title: String) {
        mainLabel.text = title
    }
    
    func setupView() {
        addSubview(mainView)
        mainView.addSubview(mainIconeView)
        mainView.addSubview(mainLabel)
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
            self.mainLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
            ])
        }
}
