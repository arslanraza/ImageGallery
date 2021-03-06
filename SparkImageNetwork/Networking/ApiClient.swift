//
//  ApiClient.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation


/// Generic APIClient
protocol APIClient {
  
  var session: URLSessionProtocol { get }
  
  func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
  func upload(with request: URLRequest, data: Data, completion: @escaping (APIError?) -> Void)
  
  func cancel()
}

extension APIClient {
  typealias CompletionHandler = (Decodable?, APIError?) -> Void
  
  func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping CompletionHandler) -> URLSessionDataTaskProtocol {
    
    let task = session.dataTask(with: request) { data, response, error in
      
      guard let httpResponse = response as? HTTPURLResponse else {
        completion(nil, .failed)
        return
      }
      
      if httpResponse.statusCode == 200 {
        if let data = data {
          do {
            let genericModel = try JSONDecoder().decode(decodingType, from: data)
            completion(genericModel, nil)
          } catch {
            completion(nil, .jsonConversionFailed)
          }
        } else {
          completion(nil, .invalidData)
        }
      } else {
        completion(nil, .responseUnsuccessful)
      }
    }
    return task
  }
  
  public func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) {
    
    let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
      
      guard let json = json else {
        if let error = error {
          completion(Result.failure(error))
        } else {
          completion(Result.failure(.invalidData))
        }
        return
      }
      if let value = decode(json) {
        completion(.success(value))
      } else {
        completion(.failure(.jsonParsingFailure))
      }
      
    }
    task.resume()
  }
  
  func upload(with request: URLRequest, data: Data, completion: @escaping (APIError?) -> Void) {
    let task = session.uploadTask(with: request, from: data) { (data, response, error) in
      guard error == nil else {
        completion(APIError.failed)
        return
      }
      completion(nil)
    }
    task.resume()
  }
  
  public func cancel() {
    session.invalidateAndCancel()
  }
  
}
