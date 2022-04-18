//
//  UserListViewController+TableView.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit

//MARK: - table view
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {

  func setupTable() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100

    tableView.register(UserTableViewCell.self)

    tableView.backgroundColor = .clear
    tableView.dataSource = self
    tableView.delegate = self
    tableView.showsVerticalScrollIndicator = true
    tableView.showsHorizontalScrollIndicator = false
    tableView.separatorInset.left = 16
    tableView.separatorInset.right = 16
    tableView.separatorStyle = .none
    tableView.allowsSelection = true
    tableView.tableFooterView = UIView()

    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeue(UserTableViewCell.self)
    if let users = users {
      cell.viewModel = users[indexPath.row]
    }
    return cell

  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    if let users = users {
      let viewController = UIStoryboard.user.instantiate(viewController: UserDetailsViewController.self)
      viewController.user = users[indexPath.row]
      if let navigation = navigationController {
        navigation.pushViewController(viewController, animated: true)
      }
    }
  }
}
