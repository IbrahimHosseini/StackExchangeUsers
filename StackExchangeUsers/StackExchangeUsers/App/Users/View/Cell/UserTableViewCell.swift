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
  @IBOutlet weak var profileImageView: UIImageView!

  var cancellable = Set<AnyCancellable>()
  var viewModel: UserTableCellViewModel? {
    didSet {
      setupBinding()
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  private func setupBinding() {
    
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    nameLabel.text = nil
    dateLabel.text = nil
    profileImageView.image = nil
  }
}
