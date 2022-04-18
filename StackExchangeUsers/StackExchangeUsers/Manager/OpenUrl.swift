//
//  OpenUrl.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit
import SafariServices

public func openUrl(_ url: String, viewController: UIViewController) {
  guard let urlAddress = URL(string: url) else { return }

  if !UIApplication.shared.canOpenURL(urlAddress) {
    return
  }

  let vc = SFSafariViewController(url: urlAddress)
  viewController.present(vc, animated: true, completion: nil)
}

