//
//  UserListViewController.swift
//  Case
//
//  Created by IŞIL VARDARLI on 5.02.2025.
//

import Foundation
import UIKit

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel = UserListViewModel()
    private let userListView = UserListView()
    
    override func loadView() {
        view = userListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        setupTableView()
        viewModel.onUsersUpdated = { [weak self] in self?.userListView.tableView.reloadData() }
        viewModel.fetchUsers()
    }
    
    private func setupTableView() {
        userListView.tableView.dataSource = self
        userListView.tableView.delegate = self
        userListView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = viewModel.users[indexPath.row]
        cell.textLabel?.text = "\(user.name) - \(user.email)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.row]
        let detailViewModel = UserDetailViewModel(user: user)
        let detailVC = UserDetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
