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
  func uploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping DataTaskResult) -> URLSessionUploadTaskProtocol
  func invalidateAndCancel()
}

//MARK: Conform the protocol
extension URLSession: URLSessionProtocol {
  func uploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionUploadTaskProtocol {
    let task: URLSessionUploadTask = uploadTask(with: request, from: bodyData)
    return task
  }
  
  
  
  func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
    let task: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler)
    return task
  }
  
  
  
}
