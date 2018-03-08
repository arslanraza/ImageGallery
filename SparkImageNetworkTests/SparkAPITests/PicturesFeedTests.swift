//
//  PicturesFeedTests.swift
//  SparkImageNetworkTests
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import SparkImageNetwork

class PicturesFeedTests: QuickSpec {
  override func spec() {
    describe("A PicturesFeed") {
      
      context("when created", {
        let picturesFeedAll = PicturesFeed.all
        let picturesFeedFavs = PicturesFeed.favorites
        it("all feed should have correct url request", closure: {
          expect(picturesFeedAll.request.url?.absoluteString).to(equal(picturesFeedAll.base + picturesFeedAll.path))
        })
        
        it("favorites should have correct url request", closure: {
          expect(picturesFeedFavs.request.url?.absoluteString).to(equal(picturesFeedFavs.base + picturesFeedFavs.path))
        })
        
      })
    }
  }
}
