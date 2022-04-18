//
//  UserListViewController.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit
import Combine

class UserListViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!


  // MARK: - Properties
  var cancellable = Set<AnyCancellable>()

  var users: [UserTableCellViewModel]?
  private var viewModel: UserViewModel!

  // MARK: - View controller life cycle methods

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupTable()
    setupBinding()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    loadData()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  // MARK: - Functions

  fileprivate func setupView() {
    title = "Stack Exchange"
    viewModel = UserViewModel()
  }

  @objc func loadData() {
    viewModel.getUsers()
  }

  fileprivate func setupBinding() {
    viewModel.$users
      .receive(on: RunLoop.main)
      .sink { [weak self] users in
        guard let self = self else { return }
        guard let users = users else { return }

        if users.count > 0 {
          self.users = users
          self.tableView.reloadData()
        } else {
          print("No item available")
        }

      }
      .store(in: &cancellable)
  }


  // MARK: - Actions
}
