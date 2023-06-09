//
//  CriacaoVooService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/04/23.
//

import Foundation

class CriacaoVooService {
    
    func apiCall(model: CriacaoVooModel, callback: @escaping(Result<Any, ServiceError>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/travel/flight") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "name": model.name,
            "idUser": model.idUser,
            "departureDate": model.departureDate,
            "returnDate": model.returnDate,
            "origin": model.origin,
            "destiny": model.destiny,
            "price": model.price,
            "vacancies": model.vacancies,
            "classType": model.classType,
            "airline": model.airline,
            "images": model.images,
            "availableSeats": model.availableSeats
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
