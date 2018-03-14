[![Build Status](https://travis-ci.org/arslanraza/ImageGallery.svg?branch=master)](https://travis-ci.org/arslanraza/ImageGallery)

# ImageGallery

## Platform:

* XCode 9.2
* Minimum OS Version: 10.0
* Recommended to run the app on device to test the image capture functionality. The app will also run and compile for simulator but the pictures can only be selected from the image gallery.
* The app supports all orientations and screen sizes.

---
## About:

* The goal of the project is to create an image gallery that fetches the pictures from the Server.
* A user can take a picture from the camera or select from the Photo gallery.
* The selected picture can then be cropped or rotated before uploading it to the server.

## Structure:

* The app is divided in 3 main targets

### ImageGallery

* This target uses MVVM pattern to layout the UI as follow

##### A tabbar controller that has 3 tabs

* ImageGalleryViewController: Image gallery view
* ImageCaptureViewController: A subclass of ImagePickerController to display camera and library view so the user can take or select a picture
* AboutViewController: Contains information regarding the project

### ImageGalleryCore (framework)

* Defines the models that will be used in the app. The model conforms to Codable protocol for json serialization

### ImageNetwork (framework)

##### Network

* Defines a generic protocol based APIClient and Result class that carries out the network operation for fetching and uploading the image

##### Mock Server

* A class that mimics the behaviour of the server using RealmSwift framework.
* This class conforms to the URLSessionProtocol and is being injected in the above network layer for default networking operations.

## Unit Tests

##### Unit tests are writting using _**QUICK**_ and _**NIMBLE**_ framework and covers the following targets

* ImageGallery target for individual ViewControllers
* Model serialization in ImageGalleryCore framekwork
* ImageNetwork operations using mock server and mock data tasks.

## Other frameworks

##### Following frameworks has been used

* **ImagePicker**: A framework to display camera and library to select pictures
* **CropViewController**: A ViewController subclass to perform image manipulation
* **HERO**: To help with viewController transition when selecting an image from the gallery.


## Suggested Improvements:

* The pictures should have thumbnails on the gallery view
* The server should create a thumbnail of the uploaded image and store it.
* Increase code coverage for both ImageGallery and ImageNetwork targets.
* Add functionality to update and remove an image.
* Display title, description and dates on the picture.
* Mark picture as Favorite


