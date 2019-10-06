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

	typealias ViewDataType = BankAccountViewData

	@IBOutlet var headerLabel: UILabel!
	@IBOutlet var moreButton: UIButton!

	@IBOutlet var collectionView: UICollectionView!

	@IBOutlet var pageControlIndicator: UIPageControl!

	override init(frame: CGRect) {
		super.init(frame: frame)

	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
	}

	func configureCollectionView() {
		let collectionViewFlowLayout = UICollectionViewCardLayout()
		collectionView.collectionViewLayout = collectionViewFlowLayout
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
}

extension UserAccountSummaryCollectionView: ViewDataConfigurable {
	func configureView(with viewData: BankAccountViewData) {

	}
}

extension UserAccountSummaryCollectionView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let viewCell = UICollectionViewCell()
		let view = UIView()
		view.backgroundColor = .yellow
		view.layer.cornerRadius = 12

		view.embed(into: viewCell.contentView)
		return viewCell
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

}

extension UserAccountSummaryCollectionView: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		// Open account detail view
	}

}
