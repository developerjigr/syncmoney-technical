//
//  UserAccountCollectionViewCell.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

class UserAccountCollectionViewCell: UICollectionViewCell, NibLoadable {

	typealias ViewDataType = [ViewData]

	@IBOutlet var containerView: UIView!

	@IBOutlet var imageContainerView: UIView!

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var currencyLabel: UILabel!
	@IBOutlet var accountNameLabel: UILabel!
	@IBOutlet var descriptionLabel: UILabel!
	@IBOutlet var totalLabel: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

	}

	override func awakeFromNib() {
		super.awakeFromNib()

		setupView()
	}

	func setupView() {
		imageView.layer.cornerRadius = imageView.frame.width / 2
		imageView.layer.masksToBounds = true
		imageView.clipsToBounds = true

		containerView.layer.borderColor = UIColor.white.cgColor
		containerView.layer.borderWidth = 4
		containerView.layer.cornerRadius = 15
		containerView.layer.masksToBounds = true
		containerView.clipsToBounds = true
	}


}

extension UserAccountCollectionViewCell: ViewDataConfigurable {

	func configureView(with viewData: ViewDataType) {
		imageView.backgroundColor = .black
		currencyLabel.text = "GBP"
		accountNameLabel.text = "sync. Account"
		descriptionLabel.text = "1001010 | 67-43-34"
		totalLabel.attributedText = "£1,722.90".formatPrice(for: .summaryCard)
	}

	// temp helpers
	func configureViewForSyncAccount() {
		imageView.backgroundColor = .black
		currencyLabel.text = "GBP"
		accountNameLabel.text = "sync. Account"
		descriptionLabel.text = "1001010 | 67-43-34"
		totalLabel.attributedText = "£1,722.90".formatPrice(for: .summaryCard)
	}

	func configureViewForBankAccount() {
		imageView.backgroundColor = .black
		currencyLabel.text = "GBP"
		accountNameLabel.text = "Bank Account"
		descriptionLabel.text = "1001010 | 67-43-34"
		totalLabel.attributedText = "£1,722.90".formatPrice(for: .summaryCard)
	}




}
