//
//  APIError.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation

public enum APIError: Error {
  case failed
  case jsonConversionFailed
  case invalidData
  case responseUnsuccessful
  case jsonParsingFailure
  
  var localizedDescription: String {
    switch self {
    case .failed: return "Request Failed"
    case .jsonConversionFailed: return "JSON Conversion Failure"
    case .invalidData: return "Invalid Data"
    case .responseUnsuccessful: return "Response Unsuccessful"
    case .jsonParsingFailure: return "JSON Parsing Failure"
    }
  }
}
