//
//  UITableView+Register.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit

extension UITableView {
  func register<T: UITableViewCell>(_ cell: T.Type) {
    self.register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: String(describing: cell))
  }
}
