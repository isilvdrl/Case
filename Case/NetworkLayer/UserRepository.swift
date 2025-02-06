//
//  UserRepository.swift
//  Case
//
//  Created by IŞIL VARDARLI on 4.02.2025.
//

import Foundation

class UserRepository {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        NetworkManager.shared.fetchUsers(completion: completion)
    }
}
