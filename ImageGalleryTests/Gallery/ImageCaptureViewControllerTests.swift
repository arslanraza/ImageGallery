//
//  ImageCaptureViewControllerTests.swift
//  ImageGalleryTests
//
//  Created by Arslan Raza on 11/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ImageGallery

class ImageCaptureViewControllerTests: QuickSpec {
  override func spec() {
    describe("ImageCapture controller") {
      context("when displayed", {
        
        let sut = ImageCaptureViewController()
        
        it("should have imageLimit set to 1", closure: {
          expect(sut.imageLimit).to(equal(1))
        })
        
      })
    }
  }
}
