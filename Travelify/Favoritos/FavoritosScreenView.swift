//
//  FavoritosScreenView.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 22/05/23.
//

import Foundation
import UIKit

class FavoritosScreenView: UIView {
    
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
        label.text = "Favoritos"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 32)
        label.textColor = .white
        return label
    }()

    func setupView() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
    }

    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),
            ])
        }
}

