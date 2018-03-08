//
//  URLSessionProtocol.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 8/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
  typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
  
  func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
  func invalidateAndCancel()
}

//MARK: Conform the protocol
extension URLSession: URLSessionProtocol {
  func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
    let task: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler)
    return task
  }
  
  
}
