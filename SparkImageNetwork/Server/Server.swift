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
            let path = Bundle.main.path(forResource: "image_\(i)", ofType: "jpg")
            let image = Image(id: "id_\(i)", url: path!, title: "Vacation", description: "description")
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
  
  func getAllPictures(with completion: ([Image]) -> Void) {
    
  }
  
}
