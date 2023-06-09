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
        let images: [Imagens?]
        let departureDate: String
        let returnDate: String
        let origin: String
        let available: String?
        let destiny: String
        let title: String
        let price: String
        let hotel: HotelPacote
        let flight: VooPacote
        let favored: Bool
        let error: String?
        
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
            case favored
            case error
        }
    }
    
    struct Imagens: Codable {
        let id: Int?
        let image: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case image
        }
    }
    
    struct VooPacote: Codable {
        let id: Int
        let idUser: Int
        let name: String
        let origin: String
        let destiny: String
        let departureDate: String
        let returnDate: String
        let favored: Bool
        let images: [Int?]
        let airline: String
        let price: Double
        let availableSeats: Int?
        let additional: [Int?]
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
    
    struct HotelPacote: Codable {
        let id: Int
        let idUser: Int
        let nome: String
        let local: String
        let favored: Bool
        let dataChegada: String
        let dataSaida: String
        let availableRooms: Int
        let nota: Double
        let precoDiaria: Double
        let images: [Int?]
        let additional: [Int?]
        let qtdAvaliations: Int?
        let totalAvaliations: Int?
    
        enum CodingKeys: String, CodingKey {
            case id
            case idUser
            case nome = "name"
            case local = "location"
            case favored
            case dataChegada = "departureDate"
            case dataSaida = "returnDate"
            case availableRooms
            case nota = "rate"
            case precoDiaria = "dailyPrice"
            case images
            case additional
            case qtdAvaliations
            case totalAvaliations
        }
    }
}

