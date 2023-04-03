//
//  ServiceError.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case decodeFail(Error?)
    case network(Error?)
}

