//
//  TabBarControllerTests.swift
//  ImageGalleryTests
//
//  Created by Arslan Raza on 11/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ImageGallery

class TabBarControllerTests: QuickSpec {
  override func spec() {
    describe("tabBarController") {
      context("when initialized", {
        let tabbarController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! TabBarController
        let _ = tabbarController.view
        
        it("should have 3 tabs", closure: {
          expect(tabbarController.viewControllers?.count).to(equal(3))
        })
        
        it("should have first tab as UINavigationController", closure: {
          expect(tabbarController.viewControllers?.first).to(beAnInstanceOf(UINavigationController.self))
        })
        
        it("should have second tab as UIViewController", closure: {
          expect(tabbarController.viewControllers?[1]).to(beAnInstanceOf(UIViewController.self))
        })
        
        it("should have third tab as AboutViewController", closure: {
          expect(tabbarController.viewControllers?[2]).to(beAnInstanceOf(AboutViewController.self))
        })
        
        it("should allow first tab to be selected", closure: {
          let result = tabbarController.tabBarController(tabbarController, shouldSelect: (tabbarController.viewControllers?.first)!)
          expect(result).to(beTrue())
        })
        
        it("should not allow second tab to be selected", closure: {
          let result = tabbarController.tabBarController(tabbarController, shouldSelect: (tabbarController.viewControllers?[1])!)
          expect(result).to(beFalse())
        })
        
      })
    }
  }
}
