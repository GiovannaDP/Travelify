//
//  CriacaoVooViewController.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 03/04/23.
//

import Foundation
import UIKit

class CriacaoVooViewController: UIViewController {
    
    private var customView: CriacaoVooScreenView? = nil
    private var model: CriacaoVooModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: CriacaoVooViewController())
        buildView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cleanFields()
    }
    
    func buildView() {
        view = CriacaoVooScreenView()
        customView = view as? CriacaoVooScreenView
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }

    func cleanFields() {
        customView?.destinyText.text = ""
        customView?.returnDateText.text = ""
        customView?.nomeText.text = ""
        customView?.originText.text = ""
        customView?.departureDateText.text = ""
        customView?.airlineText.text = ""
        customView?.classTypeText.text = ""
        customView?.vacanciesText.text = ""
        customView?.priceText.text = ""
        customView?.imageText.text = ""
    }
    
    func getData() {
        guard let nome = customView?.nomeText.text, let departureDate = customView?.departureDateText.text, let returnDate = customView?.returnDateText.text,  let destiny = customView?.destinyText.text,  let origin = customView?.originText.text, let price = customView?.priceText.text, let vacancies = customView?.vacanciesText.text, let classType = customView?.classTypeText.text, let airline = customView?.airlineText.text, let imageVoo = customView?.imageText.text else { return }
        let priceInt = Int(price)
        let vacanciesInt = Int(vacancies)
        let seatsInt = Int(vacancies)
        model = CriacaoVooModel(name: nome, departureDate: departureDate, returnDate: returnDate, origin: origin, destiny: destiny, classType: classType, airline: airline, idUser: UserViewModel.body.id, price: priceInt ?? 0, availableSeats: seatsInt ?? 0, vacancies: vacanciesInt ?? 0, images: [imageVoo])
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
            let service = CriacaoVooService()
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
