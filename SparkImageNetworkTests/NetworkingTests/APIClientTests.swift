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

struct MockObject: Codable {
  let name: String
}

class MockAPI: APIClient {
  var session: URLSession
  
  init() {
   self.session = URLSession(configuration: .default)
  }
  
  func fetch(with request: URLRequest, decode: @escaping (Decodable) -> MockObject?, completion: @escaping (Result<MockObject, APIError>) -> Void) {
    let mockObject = MockObject(name: "mock")
    completion(.success(mockObject))
  }

}

class APIClientTests: QuickSpec {
  override func spec() {
    describe("APIClient") {
      context("after initializing", {
        
        let api = MockAPI()
        var success = false
        api.fetch(with: URLRequest.init(url: URL(string: "http://someurl.com")!), decode: { object -> Decodable? in
          return object
        }, completion: { result in
          switch result {
          case .success(_):
            success = true
          case .failure(_):
            print("error: ")
          }
        })
        
        it("should pass", closure: {
          expect(success).to(beTrue())
        })
      })
    }
  }
}

