//
//  CriacaoHotelService.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/04/23.
//

import Foundation

class CriacaoHotelService {
    
    func apiCall(model: CriacaoHotelModel, callback: @escaping(Result<Any, ServiceError>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/travel/hotel") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body : [String: AnyHashable] = [
            
            "name": model.name,
            "idUser": model.idUser,
            "location": model.location,
            "rate": model.rate,
            "departureDate": model.departureDate,
            "returnDate": model.returnDate,
            "dailyPrice": model.dailyPrice,
            "images": model.images,
            "availableRooms": model.availableRooms
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
