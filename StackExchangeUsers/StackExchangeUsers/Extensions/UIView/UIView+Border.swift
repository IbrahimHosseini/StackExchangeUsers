//
//  UIView+Border.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit

extension UIView {
  func setBorder(color: UIColor, width: CGFloat?) {
    self.layer.borderColor = color.cgColor
    self.layer.borderWidth = width ?? layer.borderWidth
  }
}

