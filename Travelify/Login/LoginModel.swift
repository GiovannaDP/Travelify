//
//  LoginModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation

struct LoginModel: Codable {
    let password: String
    let username: String
}

struct UserResponse: Codable {
    let userId: Int
    let name: String
    let profileType: String
    let username: String
    let email: String
    let phone: String
    let hotels: [HoteisModel.Hotel]
    let flights: [VoosModel.Voo]
    let packages: [PacotesModel.Pacote]
    let messages: [Messages]
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name
        case profileType
        case username
        case email
        case phone
        case hotels
        case flights
        case packages
        case messages
        case error
    }
    
    struct Messages: Codable {
        let id: Int
        let message: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case message
        }
    }
}


