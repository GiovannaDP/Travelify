//
//  PacotesScreenViewCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class PacotesScreenViewCell: UITableViewCell {
    
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
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.image = UIImage(systemName: "car")
        return view
    }()
    
    lazy var tituloVigemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PACOTE GRAMADO"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 16)
        return label
    }()
    
    lazy var iconHotel: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "building")
        view.tintColor = .black
        return view
    }()
    
    lazy var hotelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hotel Ibis"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 14)
        return label
    }()
    
    lazy var iconAirplane1: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "airplane")
        view.tintColor = .black
        return view
    }()
    
    lazy var vooLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Voo pela TAM"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 14)
        return label
    }()
    
    lazy var departureDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10/10/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var returnDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "30/10/2023"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var vagasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5 vagas restantes"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        label.textColor = .red
        return label
    }()
    
    lazy var precoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$500,00"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 14)
        label.textColor = UIColor.init(red: 255/255, green: 149/255, blue: 0/255, alpha: 1.0)
        return label
    }()
    
    func setupView() {
        addSubview(mainView)
        
        mainView.addSubview(tituloVigemLabel)
        mainView.addSubview(mainImageView)
        mainView.addSubview(hotelLabel)
        mainView.addSubview(vooLabel)
        mainView.addSubview(departureDateLabel)
        mainView.addSubview(returnDateLabel)
        mainView.addSubview(vagasLabel)
        mainView.addSubview(precoLabel)
    }
    
    func configuraCelula(_ viagem: PacotesModel.Pacote?) {
        mainImageView.image = UIImage(named: viagem?.mainImage ?? "")
        tituloVigemLabel.text = viagem?.title ?? ""
        hotelLabel.text = viagem?.hotel.nome ?? ""
        vooLabel.text = viagem?.flight.airline ?? ""
        departureDateLabel.text = viagem?.departureDate ?? ""
        returnDateLabel.text = viagem?.returnDate ?? ""
        precoLabel.text = "R$\(viagem?.price ?? "")"
        vagasLabel.text = "\(viagem?.flight.availableSeats ?? 0)"
        
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
            
            self.tituloVigemLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            self.tituloVigemLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),

            self.mainImageView.topAnchor.constraint(equalTo: tituloVigemLabel.bottomAnchor, constant: 10),
            self.mainImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            self.mainImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            self.mainImageView.heightAnchor.constraint(equalToConstant: 200),
            
            self.hotelLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 5),
            self.hotelLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30),
            
            self.vooLabel.centerYAnchor.constraint(equalTo: hotelLabel.centerYAnchor),
            self.vooLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30),
            
            self.departureDateLabel.topAnchor.constraint(equalTo: hotelLabel.bottomAnchor, constant: 5),
            self.departureDateLabel.centerXAnchor.constraint(equalTo: hotelLabel.centerXAnchor),
            
            self.returnDateLabel.centerYAnchor.constraint(equalTo: departureDateLabel.centerYAnchor),
            self.returnDateLabel.centerXAnchor.constraint(equalTo: vooLabel.centerXAnchor),
            
            self.precoLabel.topAnchor.constraint(equalTo: departureDateLabel.bottomAnchor, constant: 5),
            self.precoLabel.centerXAnchor.constraint(equalTo: departureDateLabel.centerXAnchor),
            
            self.vagasLabel.centerYAnchor.constraint(equalTo: precoLabel.centerYAnchor),
            self.vagasLabel.centerXAnchor.constraint(equalTo: returnDateLabel.centerXAnchor),
            ])
        }
}
