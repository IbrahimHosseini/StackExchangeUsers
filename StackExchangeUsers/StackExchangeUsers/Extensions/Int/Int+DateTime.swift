//
//  Int+DateTime.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import Foundation


class DateTime {
  class func getTime(from time: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(time))
    let timeAgo = date.timeAgoSinceNow()
    return timeAgo
  }
}

extension Date {

  func timeAgoSinceNow() -> String {

    // From Time
    let fromDate = self

    // To Time
    let toDate = Date()

    // Estimation
    // Year
    if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
      if interval == 1 {
        return "\(interval) year"
      } else {
        return "\(interval) years"
      }
    }

    // Month
    if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {
      if interval == 1 {
        return "\(interval) month"
      } else {
        return "\(interval) months"
      }
    }

    // Day
    if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
      return "\(interval) days"
    }
    return "Today"
  }
}


extension Int {
  func timeAgo() -> String {
    return DateTime.getTime(from: self)
  }
}
