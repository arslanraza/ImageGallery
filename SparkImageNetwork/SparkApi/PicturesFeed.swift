//
//  PicturesFeed.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation


/// Enum to define different type of Pictues end point
///
/// - all: End point to return all the pictures
/// - favorites: End point to return only the favorites
public enum PicturesFeed {
  case all
  case favorites
}

extension PicturesFeed: EndPoint {
  var base: String {
    return "http://sparttest.com"
  }
  
  var path: String {
    switch self {
    case .all:
      return "/all"
    case .favorites:
      return "/favorites"
    }
  }
}
