//
//  UserAccountSummaryCollectionView.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

class UserAccountSummaryCollectionView: UIView {

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
	
}
