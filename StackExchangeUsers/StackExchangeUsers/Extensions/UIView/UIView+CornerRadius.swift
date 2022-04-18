//
//  UIView+CornerRadius.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//


import UIKit

extension UIView {

  @IBInspectable
  var cornerRadius: CGFloat {
    get { layer.cornerRadius }
    set { layer.cornerRadius = newValue }
  }

  func makeItCapsuleOrCircle(isMask: Bool = true) {
    if self.frame.height >= self.frame.width {
      self.layer.cornerRadius = self.frame.width / 2
    } else {
      self.layer.cornerRadius = self.frame.height / 2
    }

    self.layer.masksToBounds = isMask
  }

  func setCornerRadius(_ radius: CGFloat = 15, isMask: Bool = true) {
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = isMask
  }

  func setCornerRadius(to corners: UIRectCorner, radius: CGFloat, isMask: Bool = true) {
    clipsToBounds = isMask
    layer.cornerRadius = radius
    layer.maskedCorners = roundCorners(corners: corners)
  }

  fileprivate func roundCorners(corners: UIRectCorner) -> CACornerMask {
    let cornerMasks = [
      corners.contains(.topLeft) ? CACornerMask.layerMinXMinYCorner : nil,
      corners.contains(.topRight) ? CACornerMask.layerMaxXMinYCorner : nil,
      corners.contains(.bottomLeft) ? CACornerMask.layerMinXMaxYCorner : nil,
      corners.contains(.bottomRight) ? CACornerMask.layerMaxXMaxYCorner : nil,
      corners.contains(.allCorners) ? [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner, CACornerMask.layerMinXMaxYCorner, CACornerMask.layerMaxXMaxYCorner] : nil
    ].compactMap({ $0 })

    var maskedCorners: CACornerMask = []
    cornerMasks.forEach { (mask) in maskedCorners.insert(mask) }

    return maskedCorners
  }
}


