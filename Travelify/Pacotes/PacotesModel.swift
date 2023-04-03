//
//  PacotesModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation

enum PacotesModel {
    
    struct Pacote: Codable {
        let id: Int
        let mainImage: String
        let images: [Imagens]?
        let departureDate: String
        let returnDate: String
        let origin: String
        let available: Int?
        let destiny: String
        let title: String
        let price: String
        let hotel: HoteisModel.Hotel
        let flight: VoosModel.Voo
        
        enum CodingKeys: String, CodingKey {
            case id
            case mainImage
            case images
            case departureDate
            case returnDate
            case origin
            case available
            case destiny
            case title
            case price
            case hotel
            case flight
        }
    }
    
    struct Imagens: Codable {
        let id: Int
        let image: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case image
        }
    }
}

