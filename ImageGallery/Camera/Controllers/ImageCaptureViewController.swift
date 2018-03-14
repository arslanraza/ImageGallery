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
import SVProgressHUD

enum Notification: String {
  case imageUploaded
}

class ImageCaptureViewController: ImagePickerController {
  
  
  
  // MARK: Properties
  
  let viewModel = ImageCaptureViewModel()
  
  // MARK: Life Cycle Methods
  convenience init() {
    var configuration = Configuration()
    configuration.doneButtonTitle = "Done"
    configuration.noImagesTitle = "Sorry! There are no images here!"
    configuration.recordLocation = false
    configuration.canRotateCamera = false
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
    SVProgressHUD.show()
    viewModel.upload(image) { [weak self] error in
      SVProgressHUD.dismiss()
      guard error == nil else {
        let alert = UIAlertController(title: "Upload error", message: "try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self?.present(alert, animated: true, completion: nil)
        return
      }
      NotificationCenter.default.post(name: NSNotification.Name(Notification.imageUploaded.rawValue), object: self)
      cropViewController.dismiss(animated: true, completion: nil)
    }
    
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
