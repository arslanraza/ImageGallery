//
//  URLSessionDataTaskProtocol.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 8/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
  func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
