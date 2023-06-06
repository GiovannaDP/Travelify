//
//  CriacaoPacoteModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 05/06/23.
//

import Foundation

struct CriacaoPacoteModel: Codable {
    let mainImage, departureDate, returnDate, origin, destiny, title: String
    let idUser, price, idHotel, idFlight: Int
}

