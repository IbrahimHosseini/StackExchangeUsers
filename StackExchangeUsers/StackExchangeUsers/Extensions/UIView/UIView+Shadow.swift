//
//  UIView+Shadow.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit

extension UIView {
  func setShadow(shadowColor: UIColor = .systemGray,
                 offSet: CGSize = CGSize(width: 0, height: 0),
                 opacity: Float = 0.5,
                 shadowRadius: CGFloat = 5,
                 cornerRadius: CGFloat = 5) {
    self.layer.shadowOpacity = opacity
    self.layer.shadowRadius = shadowRadius
    self.layer.shadowColor = shadowColor.cgColor
    self.layer.shadowOffset = offSet
  }
}
