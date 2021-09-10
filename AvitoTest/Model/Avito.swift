//
//  Avito.swift
//  AvitoTest
//
//  Created by macbookp on 10.09.2021.
//

import Foundation


import Foundation

struct Avito: Decodable {
    let company: Company
}

struct Company: Decodable {
    let name: String
    let employees: [Employee]
}

struct Employee: Decodable {
    let name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
