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

	@IBOutlet var accountTotalLabel: UILabel!
	@IBOutlet var accountCurrencyTypeLabel: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override func awakeFromNib() {
		super.awakeFromNib()

	}
}

extension UserDetailHeaderView: ViewDataConfigurable {

	func configureView(with viewData: DetailHeaderViewData) {
		self.accountTotalLabel.attributedText = viewData.amount.formatPrice(for: .header)
		self.accountCurrencyTypeLabel.text = viewData.currencyName
	}

	func configureView() {
		self.accountTotalLabel.attributedText = accountTotalLabel.attributedText?.string.formatPrice(for: .header)
	}




}

