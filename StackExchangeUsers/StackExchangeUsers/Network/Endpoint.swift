//
//  Endpoint.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation

struct Endpoint {
  var path: String
  var basePath: String
  var queryItems: [String: Any] = [:]
}

extension Endpoint {

  static let version = "2.3"

  static let basePath = "/\(version)/"

  var url: URL {
    var components = URLComponents()

    components.scheme = ConfigurationAddress.shared.scheme
    components.host = ConfigurationAddress.shared.host
    components.path = basePath + path

    var queryParameterItems: [URLQueryItem] = []

    queryItems.forEach { (item: (key: AnyHashable, value: Any)) in
      if item.value is [UInt64] {
        (item.value as! [UInt64]).forEach({ (int) in
          queryParameterItems.append(URLQueryItem(name: "\(item.key)" + "[]", value: "\(int)"))
        })
      } else {
        queryParameterItems.append(URLQueryItem(name: "\(item.key)", value: "\(item.value)"))
      }
    }

    components.queryItems?.forEach({ (item) in
      queryParameterItems.append(item)
    })

    if queryParameterItems != [] {
      components.queryItems = queryParameterItems
    }

    /// To decode URL string and remove percent in url
    guard let componentsUrl = components.url,
          let decodeUrl = componentsUrl.absoluteString.removingPercentEncoding,
          let url = URL(string: decodeUrl)
    else {
      preconditionFailure("Invalid URL components: \(components)")
    }

    return url
  }

  var headers: [String: Any] {
    return ["Accept": "application/json",
            "Content-Type": "application/json"]
  }
}
