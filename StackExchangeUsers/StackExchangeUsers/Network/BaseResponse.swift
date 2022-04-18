//
//  BaseResponse.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
  let items: [T]?
  let has_more: Bool?
  let quota_max: Int
  let quota_remaining: Int
}
