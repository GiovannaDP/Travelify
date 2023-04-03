//
//  LoginService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation

class LoginService {
    
    func apiCall(model: LoginModel, callback: @escaping(Result<Any, ServiceError>) -> Void) {
        
        var components = URLComponents(string: "http://localhost:8080/travel/user")!
            components.queryItems = [
                URLQueryItem(name: "username", value: model.username),
                URLQueryItem(name: "password", value: model.password)
            ]
        
        var request = URLRequest(url: components.url!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            do {
                let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                callback(.success(userResponse))
                
            } catch {
                callback(.failure(.decodeFail(error)))
            }
        }
        task.resume()
    }
}

