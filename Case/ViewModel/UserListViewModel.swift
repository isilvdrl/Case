//
//  UserListViewModel.swift
//  Case
//
//  Created by IŞIL VARDARLI on 4.02.2025.
//

import Foundation

class UserListViewModel {
    private let repository = UserRepository()
    var users: [User] = []
    var onUsersUpdated: (() -> Void)?
    
    func fetchUsers() {
        repository.getUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.onUsersUpdated?()
                case .failure(let error):
                    print("Error fetching users: \(error.localizedDescription)")
                }
            }
        }
    }
}
