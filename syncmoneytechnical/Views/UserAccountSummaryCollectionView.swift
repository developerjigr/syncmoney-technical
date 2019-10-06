//
//  UserAccountSummaryCollectionView.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

class UserAccountSummaryCollectionView: UIView, NibLoadable {

	typealias ViewDataType = [ViewData]

	@IBOutlet var headerLabel: UILabel!
	@IBOutlet var moreButton: UIButton!

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControlIndicator: UIPageControl!

	var bankAccountViewData: [BankAccountViewData] = [] {
		didSet {
			collectionView.reloadData()
		}
	}

	var syncAccountViewData: [ViewDataType] = [] {
		didSet {
			collectionView.reloadData()
		}
	}

	var accountType: AccountType?

	override init(frame: CGRect) {
		super.init(frame: frame)

	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		configureCollectionView()
	}

	func configureCollectionView() {
		let collectionViewFlowLayout = UICollectionViewCardLayout()
		collectionViewFlowLayout.scrollDirection = .horizontal
		collectionView.collectionViewLayout = collectionViewFlowLayout
		collectionView.delegate = self
		collectionView.dataSource = self

		collectionView.register(
			UINib(nibName: String(describing: UserAccountCollectionViewCell.self), bundle: nil),
			forCellWithReuseIdentifier: String(describing: UserAccountCollectionViewCell.self)
		)
	}

}

extension UserAccountSummaryCollectionView {
	func configureView(with viewData: [ViewData]) {
	}

	func configureView(for accountType: AccountType) {
		self.accountType = accountType
		switch accountType {
		case .bankAccount:
			headerLabel.text = "Bank Accounts (6)"
		case .syncAccount:
			headerLabel.text = "sync. Accounts (6)"
		}
		pageControlIndicator.numberOfPages = 6
		collectionView.reloadData()
	}
}

extension UserAccountSummaryCollectionView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard
			let viewCell = collectionView.dequeueReusableCell(
				withReuseIdentifier: String(describing: UserAccountCollectionViewCell.self),
				for: indexPath
			) as? UserAccountCollectionViewCell
		else {
			fatalError("Unable to deque cell")
		}
		if let accountType = accountType {
			switch accountType {
			case .bankAccount:
				viewCell.configureViewForBankAccount()
			case .syncAccount:
				viewCell.configureViewForSyncAccount()
			}
		}

		return viewCell
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

}

extension UserAccountSummaryCollectionView: UICollectionViewDelegateFlowLayout {

	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		pageControlIndicator.currentPage =  Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
	}

	func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
		pageControlIndicator.currentPage =  Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		// Open account detail view
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
	}

}
