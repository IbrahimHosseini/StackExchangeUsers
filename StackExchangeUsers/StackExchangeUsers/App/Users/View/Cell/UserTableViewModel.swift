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

  init() {

    setupBinding()
  }

  private func setupBinding() {

  }
}
