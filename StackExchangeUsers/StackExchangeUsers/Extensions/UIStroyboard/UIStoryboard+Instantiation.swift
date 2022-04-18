//
//  UIStoryboard+Instantiation.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit

extension UIStoryboard {
  func instantiate<T: UIViewController>(viewController: T.Type) -> T {
    return self.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
  }
}

