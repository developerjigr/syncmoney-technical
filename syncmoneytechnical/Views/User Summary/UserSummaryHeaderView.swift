//
//  UserSummaryHeaderView.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

struct SummaryHeaderViewData {
	let amount: String
	let currencyName: String
}

class UserSummaryHeaderView: UIView, NibLoadable {
	typealias ViewDataType = SummaryHeaderViewData

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

extension UserSummaryHeaderView: ViewDataConfigurable {

	func configureView(with viewData: SummaryHeaderViewData) {
		self.accountTotalLabel.attributedText = viewData.amount.formatPrice(for: .header)
		self.accountCurrencyTypeLabel.text = viewData.currencyName
	}

	func configureView() {
		self.accountTotalLabel.attributedText = accountTotalLabel.attributedText?.string.formatPrice(for: .header)
	}




}

