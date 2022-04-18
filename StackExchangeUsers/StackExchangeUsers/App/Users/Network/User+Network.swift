//
//  User+Network.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation
import Combine

extension Endpoint {
  private static let userList = "users"

  static func getUsers() -> Self {
    let items = ["site": "stackoverflow",
                 "page": "1",
                 "pagesize": "100",
                 "order": "desc",
                 "sort":"reputation"]
    
    return Endpoint(path: userList,
                    basePath: basePath,
                    queryItems: items)
  }
}

protocol UsersProtocol: ServiceProtocol {
  func getUsers() -> AnyPublisher<BaseResponse<User>, Error>
}

final class UserService: UsersProtocol {

  var networkController: NetworkControllerProtocol

  init(_ networkController: NetworkController) {
    self.networkController = networkController
  }

  func getUsers() -> AnyPublisher<BaseResponse<User>, Error> {
    let endpoint = Endpoint.getUsers()

    return networkController.get(type: BaseResponse<User>.self,
                                 url: endpoint.url,
                                 headers: endpoint.headers)
  }
}
