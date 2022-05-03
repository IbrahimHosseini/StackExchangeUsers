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

  private func getResponse(_ response: Result<RetrieveImageResult, KingfisherError>) {
    switch response {
    case .success(let result):
      printLog("\(result.image)")
    case .failure(let error):
      printLog(error.localizedDescription)
    }
  }

  private func setImage(with resource: ImageResource,
                        completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)?) {
    setImageWithKingfisher(resource) { [weak self] response in
      guard let self = self else { return }
      self.getResponse(response)
      completion?(response)
    }
  }

  private func cancelDownloadTask() {
    self.kf.cancelDownloadTask()
  }

  private func getResource(_ completion: (ImageResource) -> Void) {
    guard let url = imageUri, let downloadURL = URL(string: url) else { return }
    let resource = ImageResource(downloadURL: downloadURL)
    completion(resource)
  }

  private func setImage(_ completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
    cancelDownloadTask()
    getResource { resource in
      setImage(with: resource, completion: completion)
    }
  }
}

