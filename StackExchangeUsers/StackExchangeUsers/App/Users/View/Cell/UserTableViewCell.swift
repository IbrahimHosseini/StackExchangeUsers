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

    containerView.setCornerRadius(15, isMask: false)
    containerView.setShadow()

    profileImageView.makeItCapsuleOrCircle()
  }
  private func setupBinding() {
    viewModel?.$name
      .map{$0}
      .assign(to: \.text, on: nameLabel)
      .store(in: &cancellable)

    viewModel?.$date
      .receive(on: RunLoop.main)
      .sink { [weak self] date in
        guard let self = self else { return }

        self.dateLabel.text = "Member of \(date)"
      }
      .store(in: &cancellable)

    viewModel?.$profileImage
      .map{$0}
      .assign(to: \.imageUri, on: profileImageView)
      .store(in: &cancellable)
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    nameLabel.text = nil
    dateLabel.text = nil
    profileImageView.image = nil
  }
}
