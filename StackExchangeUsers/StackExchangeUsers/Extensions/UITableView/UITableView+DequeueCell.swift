//
//  UITableView+DequeueCell.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit

extension UITableView {
  func dequeue<T: UITableViewCell>(_ cell: T.Type) -> T {
    self.dequeueReusableCell(withIdentifier: String(describing: cell)) as! T
  }
}
