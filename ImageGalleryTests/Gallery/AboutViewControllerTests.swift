//
//  AboutViewControllerTests.swift
//  ImageGalleryTests
//
//  Created by Arslan Raza on 11/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ImageGallery

class AboutViewControllerTests: QuickSpec {
  override func spec() {
    describe("About controller") {
      context("when displayed", {
        
        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        let _ = sut.view
        
        it("should have a textView", closure: {
          expect(sut.textView).notTo(beNil())
        })
        
      })
    }
  }
}
