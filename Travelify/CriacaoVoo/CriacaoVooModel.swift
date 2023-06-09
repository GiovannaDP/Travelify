//
//  CriacaoVooModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/04/23.
//

import Foundation

struct CriacaoVooModel: Codable {
    let name, departureDate, returnDate, origin, destiny, classType, airline: String
    let idUser, price, availableSeats, vacancies: Int
    let images: [String]
}
