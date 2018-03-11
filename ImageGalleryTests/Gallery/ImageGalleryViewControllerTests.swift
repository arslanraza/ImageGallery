//
//  ImageGalleryViewControllerTests.swift
//  ImageGalleryTests
//
//  Created by Arslan Raza on 8/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ImageGallery

class ImageGalleryViewControllerTests: QuickSpec {
  override func spec() {
    describe("ImageGallery") {
      context("when loaded", {
        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageGalleryViewController") as! ImageGalleryViewController
        let _ = sut.view
        
        it("should have a collectionView", closure: {
          expect(sut.collectionView).notTo(beNil())
        })
      })
    }
  }
}
