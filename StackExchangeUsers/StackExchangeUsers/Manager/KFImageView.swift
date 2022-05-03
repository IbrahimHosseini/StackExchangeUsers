//
//  KFImageView.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit
import Kingfisher

class KFImageView: UIImageView {

  //MARK: - properties
  var imageUri: String? {
    didSet {
      setImage()
    }
  }
  var placeholder: UIImage?

  var indicatorType: IndicatorType = .activity {
    didSet {
      setIndicator()
    }
  }

  var indicatorColor: UIColor = .gray {
    didSet {
      setIndicatorTintColor()
    }
  }

  //MARK: - functions
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initView()
    setIndicator()
    setIndicatorTintColor()
  }

  private func setIndicator() {
    self.kf.indicatorType = indicatorType
  }

  private func setIndicatorTintColor() {
    self.kf.indicator?.view.tintColor = .gray
  }

  private func initView() {
    clipsToBounds = true
  }


  /// Download image from kingfisher lib.
  /// Set the default placeholder for any of images.
  /// Set a transition to image view when image loading.
  /// Set the progress block t download the download progress block
  ///
  /// - Parameters:
  ///   - resource: an initial download url
  ///   - completion: result of kingfisher to get an image from server
  private func setImageWithKingfisher(_ resource: ImageResource,
                                      completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)?) {
    self.kf.setImage(with: resource,
                     placeholder: placeholder,
                     options: [.transition(.fade(0.25))],
                     progressBlock: nil) { response in
      completion?(response)
    }
  }

  private func printLog(_ data: String) {
    print("LOAD IMAGE RESULT-> \(data)")
  }

  /// Get the response from Result of response
  /// - Parameter response: a response type which get from kingfisher downloder
  private func getResponse(_ response: Result<RetrieveImageResult, KingfisherError>) {
    switch response {
    case .success(let result):
      printLog("\(result.image)")
    case .failure(let error):
      printLog(error.localizedDescription)
    }
  }

  /// Set image and get response result and show the result is success or failure
  /// - Parameters:
  ///   - resource: an initial download url
  ///   - completion: result of setImage function which download image from kingfisher
  private func setImage(with resource: ImageResource,
                        completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)?) {
    setImageWithKingfisher(resource) { [weak self] response in
      guard let self = self else { return }
      self.getResponse(response)
      completion?(response)
    }
  }

  /// Cancel download tasks by kingfisher
  private func cancelDownloadTask() {
    self.kf.cancelDownloadTask()
  }

  /// Get resource from download url
  /// - Parameter completion: result from download url
  private func getResource(_ completion: (ImageResource) -> Void) {
    guard let url = imageUri, let downloadURL = URL(string: url) else { return }
    let resource = ImageResource(downloadURL: downloadURL)
    completion(resource)
  }

  /// Cancel any download tasks and set the image to image view
  /// - Parameter completion: result of setImage function which download image from kingfisher
  private func setImage(_ completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
    cancelDownloadTask()
    getResource { resource in
      setImage(with: resource, completion: completion)
    }
  }
}

