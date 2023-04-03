//
//  UserViewModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

enum UserViewModel {
    
    struct User: Codable {
        let id: Int
        let username, name, profileType, email: String
        let phone: String
        let hotels: [HoteisModel.Hotel]?
        let flights: [VoosModel.Voo]?
        let packages: [PacotesModel.Pacote]?
        let messages: [Messages]
        let error: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case username
            case name
            case profileType
            case email
            case hotels
            case phone
            case flights
            case packages
            case messages
            case error
        }
        
        init(id: Int, username: String, name: String, profileType: String, email: String, phone: String, hotels: [HoteisModel.Hotel]?, flights: [VoosModel.Voo]?, packages: [PacotesModel.Pacote]?, messages: [Messages], error: String?) {
            self.id = id
            self.username = username
            self.name = name
            self.profileType = profileType
            self.email = email
            self.phone = phone
            self.hotels = hotels
            self.flights = flights
            self.packages = packages
            self.messages = messages
            self.error = error
        }
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
