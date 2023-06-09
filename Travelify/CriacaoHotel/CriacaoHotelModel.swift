//
//  CriacaoHotelModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/04/23.
//

struct CriacaoHotelModel: Codable {
    let name, location, departureDate, returnDate: String
    let idUser, rate, dailyPrice, availableRooms: Int
    let images: [String]
}
