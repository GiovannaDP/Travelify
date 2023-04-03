//
//  HoteisService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//


import Foundation

class HoteisService {
    
    func apiCall(callback: @escaping(Result<Any, ServiceError>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/travel/allHotels") else {
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
                let vooResponse = try JSONDecoder().decode([HoteisModel.Hotel].self, from: data)
                callback(.success(vooResponse))
                
            } catch {
                callback(.failure(.decodeFail(error)))
            }
        }
        task.resume()
    }
}

