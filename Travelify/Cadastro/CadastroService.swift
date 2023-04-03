//
//  CadastroService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation

class CadastroService {
    
    func apiCall(model: CadastroModel, callback: @escaping(Result<Any, ServiceError>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/travel/user") else {
            return
        }
        
        var urlComponents = URLComponents(string: "http://localhost:8080/travel/user")!
        

        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body : [String: AnyHashable] = [
            "email": model.email,
            "name": model.name,
            "password": model.password,
            "phone": model.phone,
            "username": model.username
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            callback(.success(json))
        }
        task.resume()
    }
}

