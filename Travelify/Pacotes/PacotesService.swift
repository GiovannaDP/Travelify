//
//  PacotesService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

class PacotesService {
    
    func apiCall(callback: @escaping(Result<Any, ServiceError>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/travel/allPackages") else {
            return
        }

        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            do {
                let pacoteResponse = try JSONDecoder().decode([PacotesModel.Pacote].self, from: data)
                callback(.success(pacoteResponse))
                
            } catch {
                callback(.failure(.decodeFail(error)))
            }
        }
        task.resume()
    }
}

