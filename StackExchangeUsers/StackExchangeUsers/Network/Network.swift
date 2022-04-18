//
//  Network.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation
import Combine

// MARK: - Network Controller
protocol NetworkControllerProtocol {
  typealias Headers = [String: Any]

  func get<T>(type: T.Type,
              url: URL,
              headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkController: NetworkControllerProtocol {

  /// Get generic API
  /// - Parameters:
  ///   - type: API data type
  ///   - url: API url address
  ///   - headers: API headers
  /// - Returns: A generic object
  func get<T: Decodable>(type: T.Type,
                         url: URL,
                         headers: Headers) -> AnyPublisher<T, Error> {
    var urlRequest = URLRequest(url: url)

    headers.forEach { (key, value) in
      if let value = value as? String {
        urlRequest.setValue(value, forHTTPHeaderField: key)
      }
    }

    return URLSession.shared.dataTaskPublisher(for: urlRequest)
      .tryMap { (data, response) -> Data in
        return data
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}

