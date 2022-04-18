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

  }

  @objc func loadData() {
    // Call get user API
  }

  fileprivate func setupBinding() {

  }


  // MARK: - Actions
}
