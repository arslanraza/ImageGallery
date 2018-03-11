//
//  ImageCaptureViewController.swift
//  ImageGallery
//
//  Created by Arslan Raza on 6/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import ImagePicker
import CropViewController

class ImageCaptureViewController: ImagePickerController {
  
  convenience init() {
    var configuration = Configuration()
    configuration.doneButtonTitle = "Done"
    configuration.noImagesTitle = "Sorry! There are no images here!"
    configuration.recordLocation = false
    self.init(configuration: configuration)
    
    self.imageLimit = 1
    self.delegate = self
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension ImageCaptureViewController: CropViewControllerDelegate {
  func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
    navigationController?.popViewController(animated: true)
  }
  func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
    cropViewController.dismiss(animated: true, completion: nil)
  }
}

extension ImageCaptureViewController: ImagePickerDelegate {
  func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    
  }
  
  func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
    imagePicker.dismiss(animated: true, completion: nil)
  }
  
  func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    let cropController = CropViewController(croppingStyle: CropViewCroppingStyle.default, image: images.first!)
    cropController.delegate = self
    navigationController?.pushViewController(cropController, animated: true)
  }
}
