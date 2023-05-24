//
//  UserViewModel.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

struct UserViewModel {
        
    static var body: UserResponse = UserResponse(id: 0, name: "", profileType: "", username: "", email: "", password: "", phone: "", hotels: [], flights: [], packages: [], messages: [], error: "")

    struct Messages {
        static var id: Int = 0
        static var message: String = ""
    }
}
