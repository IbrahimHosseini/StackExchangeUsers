//
//  UserDetailsViewController.swift
//  StackExchangeUsers
//
//  Created by Ibrahim Hosseini on 4/18/22.
//

import UIKit

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
    tagLabel.numberOfLines = 0
    linkLabel.numberOfLines = 0

    profileImageView.imageUri = "https://www.gravatar.com/avatar/6d8ebb117e8d83d74ea95fbdd0f87e13?s=256&d=identicon&r=PG"
    profileImageView.makeItCapsuleOrCircle()

    imageContainerView.makeItCapsuleOrCircle(isMask: false)
    imageContainerView.setShadow()

  }

  fileprivate func refreshView() {
    guard let user = user else {
      return
    }

    nameLabel.text = user.name
    reputationLabel.text = user.reputation
    tagLabel.text = user.tags.first
    linkLabel.text = user.link
  }

  // MARK: - Actions


}
