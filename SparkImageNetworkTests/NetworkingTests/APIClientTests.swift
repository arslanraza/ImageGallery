//
//  APIClientTests.swift
//  SparkImageNetworkTests
//
//  Created by Arslan Raza on 8/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import SparkImageNetwork

class MockURLSession: URLSessionProtocol {
  
  
  private(set) var invalidateCalled = false
  var nextDataTask = MockURLSessionDataTask()
  var nextData: Data?
  var nextError: Error?
  
  private (set) var lastURL: URL?
  
  func successHttpURLResponse(request: URLRequest) -> URLResponse {
    return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
  }
  
  func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
    lastURL = request.url
    
    completionHandler(nextData, successHttpURLResponse(request: request), nextError)
    return nextDataTask
  }
  
  func uploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionUploadTaskProtocol {
    return MockURLSessionUploadTask()
  }
  
  func invalidateAndCancel() {
    invalidateCalled = true
  }
  
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
  private (set) var resumeWasCalled = false
  
  func resume() {
    resumeWasCalled = true
  }
}

class MockURLSessionUploadTask: URLSessionUploadTaskProtocol {
  private (set) var resumeWasCalled = false
  
  func resume() {
    resumeWasCalled = true
  }
}


struct MockObject: Codable {
  let name: String
}

class MockAPI: APIClient {
  var session: URLSessionProtocol
  
  init(with expectedData: Data?, expectedError: Error?) {
    let mockSession = MockURLSession()
    mockSession.nextData = expectedData
    mockSession.nextError = expectedError
    self.session = mockSession
  }
  
}

class APIClientTests: QuickSpec {
  override func spec() {
    describe("APIClient") {
      
      context("after initializing with data", {
        
        let data = "{\"name\": \"test\"}".data(using: .utf8)
        
        let api = MockAPI(with: data, expectedError: nil)
        var success = false
        let request = URLRequest(url: URL(string: "http://someurl.com")!)
        
        it("should return object", closure: {
          api.fetch(with: request, decode: { json -> MockObject? in
            guard let object = json as? MockObject else {
              return  nil
            }
            return object
          }, completion: { result in
            switch result {
            case .success(let object):
              success = object.name == "test"
            case .failure(_):
              print("error: ")
            }
          })
          expect(success).toEventually(beTrue())
        })
        
        it("should cancel if invalidate is called", closure: {
          let mockSession = api.session as! MockURLSession
          mockSession.invalidateAndCancel()
          expect(mockSession.invalidateCalled).to(beTrue())
        })
        
      })
    }
  }
}

