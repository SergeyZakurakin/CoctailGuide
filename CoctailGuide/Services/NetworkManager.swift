//
//  NetworkManager.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.api-ninjas.com/v1/cocktail?name="
    private let apiKey = "cICqhm5A062WSKAdEKbMeQ==ENY5vDAhsTGiJ9XI"
    
    private init() {}
    
    func fetchCoctails(name: String) async -> [Coctail] {
        let query = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
             let fullURLString = baseURL + query
        
        guard let url = URL(string: fullURLString) else {
            print("invalid URL")
            return []
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoded = try JSONDecoder().decode([Coctail].self, from: data)
            return decoded
            
        } catch {
            print("Error fetching cocktails: \(error.localizedDescription)")
                       return []
        }
    }
}
