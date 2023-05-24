//
//  VoosModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation

enum VoosModel {
    
    struct Voo: Codable {
        let id: Int
        let idUser: Int
        let name: String
        let origin: String
        let destiny: String
        let departureDate: String
        let returnDate: String
        let favored: Bool
        let images: [Imagens?]
        let airline: String
        let price: Double
        let availableSeats: Int?
        let additional: [Adicionais?]
        let classType: String
        let error: String?
    
        enum CodingKeys: String, CodingKey {
            case id
            case idUser
            case name
            case origin
            case destiny
            case favored
            case departureDate
            case returnDate
            case images
            case airline
            case price
            case availableSeats
            case additional
            case classType
            case error
        }
    }
    
    struct Adicionais: Codable {
        let id: Int
        let title: String
        let information: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case title
            case information
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

