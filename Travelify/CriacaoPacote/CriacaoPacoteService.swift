//
//  CriacaoPacoteService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 05/06/23.
//

import Foundation

class CriacaoPacoteService {
    
    func apiCall(model: CriacaoPacoteModel, callback: @escaping(Result<Any, ServiceError>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/travel/packages") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "title": model.title,
            "mainImage": model.mainImage,
            "idUser": model.idUser,
            "departureDate": model.departureDate,
            "returnDate": model.returnDate,
            "origin": model.origin,
            "destiny": model.destiny,
            "price": model.price,
            "idHotel": model.idHotel,
            "idFlight": model.idFlight
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
