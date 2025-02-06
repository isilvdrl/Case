//
//  APIService.swift
//  Case
//
//  Created by IŞIL VARDARLI on 4.02.2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://jsonplaceholder.typicode.com/users"
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

