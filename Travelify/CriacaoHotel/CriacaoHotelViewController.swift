//
//  CriacaoHotelViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/04/23.
//

import Foundation
import UIKit

class CriacaoHotelViewController: UIViewController {
    
    private var customView: CriacaoHotelScreenView? = nil
    private var model: CriacaoHotelModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: CriacaoHotelViewController())
        buildView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cleanFields()
    }
    
    func buildView() {
        view = CriacaoHotelScreenView()
        customView = view as? CriacaoHotelScreenView
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }

    func cleanFields() {
        customView?.locationText.text = ""
        customView?.returnDateText.text = ""
        customView?.nomeText.text = ""
        customView?.departureDateText.text = ""
        customView?.vacanciesText.text = ""
        customView?.priceText.text = ""
        customView?.imageText.text = ""
    }
    
    func getData() {
        guard let nome = customView?.nomeText.text, let departureDate = customView?.departureDateText.text, let returnDate = customView?.returnDateText.text,  let location = customView?.locationText.text, let price = customView?.priceText.text, let vacancies = customView?.vacanciesText.text, let image = customView?.imageText.text else { return }
        let priceInt = Int(price)
        let vacanciesInt = Int(vacancies)
        model = CriacaoHotelModel(name: nome, location: location, departureDate: departureDate, returnDate: returnDate, idUser: UserViewModel.body.id, rate: 0, dailyPrice: priceInt ?? 0, availableRooms: vacanciesInt ?? 0, images: [image])
    }
    
    func navigateToVendas() {
        let vc = ComAnuncioViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func callUser() {
        let model = LoginModel(password: UserViewModel.body.password, username: UserViewModel.body.username)
        
        do {
            let service = LoginService()
            service.apiCall(model: model, callback: { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        let userResponse = data as! UserResponse
                        UserViewModel.body = userResponse
                        self.navigateToVendas()
                    }
                }
            })
        }
    }

    @objc func cadastro(_ sender: UIButton) {
            self.getData()

            guard let model = model else { return }

        do {
            let service = CriacaoHotelService()
            service.apiCall(model: model, callback: {
                result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(data):
                        print(data)
                        self.callUser()
                    }
                }
            })
        }
    }
}
