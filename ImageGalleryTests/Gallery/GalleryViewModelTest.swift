//
//  GalleryViewModelTest.swift
//  ImageGalleryTests
//
//  Created by Arslan Raza on 8/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Foundation
import Quick
import Nimble

@testable import ImageGallery

class GalleryViewModelTest: QuickSpec {
  override func spec() {
    describe("GalleryViewModel") {
      
      context("when initialized first time", {
        
        let sut = GalleryViewModel()
        it("should have clean state", closure: {
          expect(sut.pictures.count).to(equal(0))
        })
        
      })
    }
  }
}
