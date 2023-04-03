//
//  HoteisModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//


import Foundation

enum HoteisModel {
    
    struct Hotel: Codable {
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
        let images: [Imagens]
        let additional: [Adicionais]?
    
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

