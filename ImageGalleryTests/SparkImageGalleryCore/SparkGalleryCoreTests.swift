//
//  SparkGalleryCoreTests.swift
//  ImageGalleryTests
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import SparkImageGalleryCore

class SparkGalleryCoreTests: QuickSpec {
  override func spec() {
    describe("A Picture") {
      
      context("when initialized", {
        let picture = Picture(id: "aasdf12321", url: "abc.png", title: "vacation", description: "some description", dateUpdated: Date(), dateTaken: Date())
        
        context("and encoded", {
          let encoder = JSONEncoder()
          let jsonData = try? encoder.encode(picture)
          
          it("should not be nil", closure: {
            expect(jsonData).notTo(beNil())
          })
          
          it("should have proper json", closure: {
            let dictionary = try? JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as! [String : AnyObject]
            expect(dictionary?["title"] as? String).to(equal(picture.title))
          })
          
          it("should be decodable", closure: {
            let decoder = JSONDecoder()
            let pictureObject = try? decoder.decode(Picture.self, from: jsonData!)
            expect(pictureObject).to(equal(picture))
          })
          
        })

      })
    }
  }
}
