//
//  UpdatePerfilService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 06/06/23.
//

import Foundation

class UpdatePerfilService {
    
    func apiCall(model: PerfilModel, callback: @escaping(Result<Any, ServiceError>) -> Void) {
        
        var components = URLComponents(string: "http://localhost:8080/travel/user")!
            components.queryItems = [
                URLQueryItem(name: "idUser", value: "\(model.id)")
            ]
        
        var request = URLRequest(url: components.url!)
        
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body : [String: AnyHashable] = [
            "email": model.email,
            "name": model.name,
            "password": model.password,
            "phone": model.phone
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            do {
                let intResponse = try JSONDecoder().decode(Int.self, from: data)
                callback(.success(intResponse))
                
            } catch {
                callback(.failure(.decodeFail(error)))
            }
        }
        task.resume()
    }
}
