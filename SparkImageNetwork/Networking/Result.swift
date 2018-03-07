//
//  Result.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation


/// Generic Result Type
///
/// - success: passes a generic Decodable object on success
/// - failure: pass an Error object upon failure
public enum Result<T, U> where U: Error {
  case success(T)
  case failure(U)
}
