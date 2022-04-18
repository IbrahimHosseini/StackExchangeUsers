//
//  UserViewModel.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation
import Combine

class UserViewModel {
  @Published var users: [UserTableCellViewModel]?

  private var service: UsersProtocol
  private var cancellable = Set<AnyCancellable>()

  init() {
    let networkController = NetworkController()
    service = UserService(networkController)
  }

  func getUsers() {
    service.getUsers()
      .sink { completion in
        switch completion {
        case .failure(let error):
          print(error)
        case .finished:
          print("Finished Set Profile")
        }
      } receiveValue: { [weak self] response in
        guard let self = self else { return }

        self.users = response.items
          .map { items in
            var users: [UserTableCellViewModel] = []
            items.forEach { user in
              users.append(UserTableCellViewModel(user))
            }
            return users
          }
      }
      .store(in: &cancellable)
  }
}
