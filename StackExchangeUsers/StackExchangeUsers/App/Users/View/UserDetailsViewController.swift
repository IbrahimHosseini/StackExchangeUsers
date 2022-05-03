//
//  UserDetailsViewController.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit
import Kingfisher

class UserDetailsViewController: UIViewController {
  // MARK: - Outlets
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var reputationLabel: UILabel!
  @IBOutlet weak var tagLabel: UILabel!
  @IBOutlet weak var linkLabel: UILabel!
  @IBOutlet weak var profileImageView: KFImageView!
  @IBOutlet weak var imageContainerView: UIView!


  // MARK: - Properties
  var user: UserTableCellViewModel?


  // MARK: - View controller life cycle methods

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    refreshView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  // MARK: - Functions

  fileprivate func setupView() {
    tagLabel.numberOfLines = 5
    linkLabel.numberOfLines = 0

    linkLabel.isUserInteractionEnabled = true

    let tap = UITapGestureRecognizer(target: self, action: #selector(openLink))
    linkLabel.addGestureRecognizer(tap)
    profileImageView.makeItCapsuleOrCircle()

    imageContainerView.makeItCapsuleOrCircle(isMask: false)
    imageContainerView.setShadow()
  }

  @objc fileprivate func openLink() {
    guard let user = user else { return }

    openUrl(user.link, viewController: self)
  }

  fileprivate func refreshView() {
    guard let user = user else {
      return
    }

    nameLabel.text = user.name
    reputationLabel.text = "Reputation: " + user.reputation
    var tags = ""
    user.tags.forEach { tag in
      guard !tag.isEmpty else { return }
      tags += "#" + tag + ", "
    }
    tagLabel.text = tags
    linkLabel.text = user.link

    profileImageView.imageUri = user.profileImage

  }

  // MARK: - Actions


}
