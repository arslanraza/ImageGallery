//
//  ImageDetailViewControllerTests.swift
//  ImageGalleryTests
//
//  Created by Arslan Raza on 11/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
import SparkImageGalleryCore
@testable import ImageGallery

class ImageDetailViewControllerTests: QuickSpec {
  override func spec() {
    describe("ImageDetail controller") {
      context("when displayed", {
        
        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageDetailViewController") as! ImageDetailViewController
        
        let mockPicture = Picture.init(id: "1354", url: "image_1.jpg", title: "Title", description: "Some description", dateUpdated: Date(), dateTaken: Date())
        sut.picture = mockPicture
        
        let _ = sut.view
        
        it("should have an ImaeView", closure: {
          expect(sut.imageView).notTo(beNil())
        })
        
      })
    }
  }
}
