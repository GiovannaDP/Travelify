//
//  ConfirmacaoModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 11/05/23.
//

import Foundation

struct ConfirmacaoVooModel: Codable {
    let idUser, idFlight, persons: Int
}

struct ConfirmacaoPacoteModel: Codable {
    let idUser, idPackage, persons: Int
}

struct ConfirmacaoHotelModel: Codable {
    let idUser, idHotel, persons: Int
}
