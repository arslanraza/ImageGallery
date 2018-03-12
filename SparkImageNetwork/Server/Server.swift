//
//  Server.swift
//  ImageGallery
//
//  Created by Arslan Raza on 12/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import RealmSwift

public class Server {
  
  
  // MARK: Life Cycle Methods
  
  init() {
    
  }
  
  // MARK: Static Methods
  public static func configureForInitialData(with completion: @escaping () -> Void) {
    let userDefault = UserDefaults.standard
    let key = "isDBConfigured"
    if !userDefault.bool(forKey: key) {
      DispatchQueue.global(qos: .background).async {
        print("This is run on the background queue")
        do {
          let realm = try Realm(configuration: RealmConfig.main.configuration)
          var images: [Image] = []
          for i in 1...14 {
            let image = Image(id: "id_\(i)", url: "image_\(i).jpg", title: "Title \(i)", description: "description")
            images.append(image)
          }
          try realm.write({
            print("Initial Data Added")
            realm.add(images)
          })
          userDefault.set(true, forKey: key)
          completion()
        } catch {
          print("Failed")
          completion()
        }
      }
    } else {
      completion()
    }
  }
  
  // MARK: Public Methods
  
  func allPictures(with completion: ((Data?)) -> Void) {
    do {
      let realm = try Realm(configuration: RealmConfig.main.configuration)
      let images = realm.objects(Image.self)
      let encoder = JSONEncoder()
      let imagesJSONData = try encoder.encode(Array(images))
      
      let imagesDictionary = try JSONSerialization.jsonObject(with: imagesJSONData, options: []) as? [[String: AnyObject]]
      let responseString: [String: [[String: AnyObject]]] = ["pictures": imagesDictionary!]
      let jsonData = try JSONSerialization.data(withJSONObject: responseString, options: .prettyPrinted)
      completion(jsonData)
    } catch {
      completion(nil)
    }
  }
  
}

class RealmDataTask: URLSessionDataTaskProtocol {
  func resume() {
    // STUB
  }
}

class RealmUploadTask: URLSessionUploadTaskProtocol {
  func resume() {
    // STUB
  }
}

extension Server: URLSessionProtocol {
  
  func successHttpURLResponse(request: URLRequest) -> URLResponse {
    return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
  }
  
  
  func uploadTask(with request: URLRequest, from bodyData: Data, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionUploadTaskProtocol {
    let uploadTask = RealmUploadTask()
    return uploadTask
  }
  
  func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
    
    let dataTask = RealmDataTask()
    
    if request.httpMethod == "GET" {
      allPictures { jsonData in
        completionHandler(jsonData, successHttpURLResponse(request: request), nil)
      }
    } else if request.httpMethod == "POST" {
      print("Perform image upload")
    }
    
    return dataTask
  }
  
  func invalidateAndCancel() {
    // STUB
  }
  
  
}
