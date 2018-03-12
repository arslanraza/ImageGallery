//
//  URLSessionUploadTaskProtocol.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 12/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation

protocol URLSessionUploadTaskProtocol {
  func resume()
}

extension URLSessionUploadTask: URLSessionUploadTaskProtocol { }
