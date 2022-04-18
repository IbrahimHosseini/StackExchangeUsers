//
//  Collective.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation

struct Collective: Codable {
  var tags: [String]?
  var external_links: [ExternalLinks]?
  var description: String?
  var link: String?
  var name: String?
  var slug: String?
}
