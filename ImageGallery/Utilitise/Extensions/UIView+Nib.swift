//
//  UIView+Nib.swift
//  ImageGallery
//
//  Created by Arslan Raza on 9/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit

extension UIView {
  
  /// Return an UINib object from the nib file with the same name.
  class var nib: UINib? {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  class var viewFromNib: UIView? {
    let views = Bundle.main.loadNibNamed(String(describing: self), owner: self, options: nil)
    let view = views![0] as! UIView
    return view
  }
  
}
