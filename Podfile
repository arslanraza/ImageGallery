# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
inhibit_all_warnings!

target 'ImageGallery' do
  use_frameworks!
  # Pods for ImageGallery
  pod 'CropViewController'
  pod 'ImagePicker'
  pod 'Hero'
  pod 'SVProgressHUD'
  
  target 'SparkImageNetwork' do
    pod 'RealmSwift'
  end
  
  target 'ImageGalleryTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
    
  end
  
  target 'SparkImageNetworkTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
    
  end
  
end
