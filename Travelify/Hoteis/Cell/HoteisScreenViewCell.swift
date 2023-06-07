//
//  HoteisScreenViewCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class HoteisScreenViewCell: UITableViewCell {
    
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
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.contentMode = .scaleToFill
        view.spacing = 20
        return view
    }()
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var firstImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.image = UIImage(systemName: "Paris-1")
        return view
    }()
    
    lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Londres"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 20)
        return label
    }()
    
    lazy var departureDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10/04/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var returnDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25/04/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var notaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var precoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$5000,00"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 14)
        label.textColor = UIColor.init(red: 255/255, green: 149/255, blue: 0/255, alpha: 1.0)
        return label
    }()

    func setupView() {
        addSubview(mainView)

        mainView.addSubview(firstImageView)
        mainView.addSubview(tituloLabel)
        mainView.addSubview(departureDateLabel)
        mainView.addSubview(returnDateLabel)
        mainView.addSubview(notaLabel)
        mainView.addSubview(precoLabel)
    }
    
    func configuraCelula(_ viagem: HoteisModel.Hotel?) {
        if UIImage(named: viagem?.images[0].image ?? "") != nil {
            firstImageView.image = UIImage(named: viagem?.images[0].image ?? "")
        } else {
            firstImageView.image = UIImage(named: "hotel")
        }
        
        guard let local = viagem?.local, let nome = viagem?.nome else { return }
        tituloLabel.text = "\(local) - \(nome)"
        departureDateLabel.text = viagem?.dataChegada
        returnDateLabel.text = viagem?.dataSaida
        precoLabel.text = "Diária: R$\(viagem?.precoDiaria ?? 0)"
        
        if let nota = viagem?.nota, nota > 0 {
            notaLabel.text = "nota: \(nota)"
        } else {
            notaLabel.isHidden = true
        }

        DispatchQueue.main.async {
            self.mainView.addSombra()
        }
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            self.firstImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            self.firstImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            self.firstImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            self.firstImageView.heightAnchor.constraint(equalToConstant: 200),

            self.tituloLabel.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 15),
            self.tituloLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            self.notaLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            self.notaLabel.centerYAnchor.constraint(equalTo: tituloLabel.centerYAnchor),

            self.departureDateLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 10),
            self.departureDateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            self.returnDateLabel.leadingAnchor.constraint(equalTo: departureDateLabel.trailingAnchor, constant: 15),
            self.returnDateLabel.centerYAnchor.constraint(equalTo: departureDateLabel.centerYAnchor),
            
            self.precoLabel.topAnchor.constraint(equalTo: departureDateLabel.bottomAnchor, constant: 10),
            self.precoLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            ])
        }
}
