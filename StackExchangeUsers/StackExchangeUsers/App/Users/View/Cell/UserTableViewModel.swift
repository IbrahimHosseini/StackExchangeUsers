//
//  UserTableViewModel.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation
import Combine

class UserTableCellViewModel {
  @Published var name = ""
  @Published var date = ""
  @Published var reputation = ""
  @Published var link = ""
  @Published var tags = [""]
  @Published var profileImage = ""

  private var user: User?
  init(_ users: User) {
    self.user = users
    setupBinding()
  }

  private func setupBinding() {
    guard let user = user else {
      return
    }

    if let name = user.display_name {
      self.name = name
    }

    if let date = user.creation_date {
      self.date = date.timeAgo()
    }

    if let reputation = user.reputation {
      self.reputation = "\(reputation)"
    }

    if let profileImage = user.profile_image {
      self.profileImage = profileImage
    }

    if let link = user.link {
      self.link = link
    }

    if let tag = user.collectives?.first?.collective?.tags {
      self.tags = tag
    }
  }
}
