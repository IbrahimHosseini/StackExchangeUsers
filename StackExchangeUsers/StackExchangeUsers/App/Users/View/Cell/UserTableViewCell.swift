//
//  UserTableViewCell.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit
import Combine

class UserTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var profileImageView: KFImageView!
  @IBOutlet weak var imageContainerView: UIView!
  @IBOutlet weak var containerView: UIView!

  var cancellable = Set<AnyCancellable>()
  var viewModel: UserTableCellViewModel? {
    didSet {
      setupBinding()
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()

    imageContainerView.makeItCapsuleOrCircle(isMask: false)
//    imageContainerView.setShadow()

    containerView.setCornerRadius(15, isMask: false)
    containerView.setShadow()

    profileImageView.makeItCapsuleOrCircle()
    profileImageView.imageUri = "https://www.gravatar.com/avatar/6d8ebb117e8d83d74ea95fbdd0f87e13?s=256&d=identicon&r=PG"

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  private func setupBinding() {
  }

//  override func prepareForReuse() {
//    super.prepareForReuse()
//    nameLabel.text = nil
//    dateLabel.text = nil
//    profileImageView.image = nil
//  }
}
