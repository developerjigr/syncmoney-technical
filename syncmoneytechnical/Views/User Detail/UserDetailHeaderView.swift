//
//  UserDetailHeaderView.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 07/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

struct DetailHeaderViewData {
	let amount: String
	let currencyName: String
	let image_url: String
	let totalAmount: String
	let accountDetails: String
}

class UserDetailHeaderView: UIView, NibLoadable {
	typealias ViewDataType = DetailHeaderViewData

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var currencyLabel: UILabel!
	@IBOutlet var accountNameLabel: UILabel!
	@IBOutlet var accountDescriptionLabel: UILabel!
	@IBOutlet var totalBalanceLabel: UILabel!
	@IBOutlet var availableBalanceLabel: UILabel!

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
		imageView.roundedFrame()
	}
}

extension UserDetailHeaderView: ViewDataConfigurable {

	func configureView(with viewData: DetailHeaderViewData) {

	}

	func configureView() {
		totalBalanceLabel.attributedText = totalBalanceLabel.attributedText?.string.formatPrice(for: .header)
	}




}

