//
//  KFImageView.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit
import Kingfisher

class KFImageView: UIImageView {
  var imageUri: String? {
    didSet {
      setImage()
    }
  }
  var placeholder: UIImage?

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initView()
  }

  private func initView() {
    clipsToBounds = true
  }

  private func setImage(_ completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
    guard let url = imageUri, let downloadURL = URL(string: url) else { return }
    let resource = ImageResource(downloadURL: downloadURL)
    self.setImage(with: resource, completion: completion)
  }

  private func setImage(with resource: ImageResource,
                        completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)?) {
    self.kf.indicatorType = .activity
    self.kf.indicator?.view.tintColor = .gray

    self.kf.cancelDownloadTask()
    self.kf.setImage(with: resource,
                     placeholder: placeholder,
                     options: [.transition(.fade(0.25))],
                     progressBlock: nil) { response in
      switch response {
      case .success(let result):
        print("LOAD IMAGE RESULT-> \(result.image)")
      case .failure(let error):
        print("LOAD IMAGER ERROR",error)
      }
      completion?(response)
    }
  }
}

