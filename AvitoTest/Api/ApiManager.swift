//
//  ApiManager.swift
//  Avito
//
//  Created by macbookp on 10.09.2021.
//

import Foundation

class ApiManager {

    static let shared = ApiManager()

    func fetchData(completion: @escaping (Avito) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
        let request = URLRequest(url: url )
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let response = try? JSONDecoder().decode(Avito.self, from: data) {
                completion(response)
            }
        }
        task.resume()
    }
}
