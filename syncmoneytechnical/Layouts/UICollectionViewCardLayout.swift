//
//  UICollectionViewCardLayout.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

class UICollectionViewCardLayout: UICollectionViewFlowLayout {

	var addedItem: IndexPath?

	override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		guard
			let defaultAttributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath),
			let collectionView = collectionView,
			let added = addedItem,
			added == itemIndexPath
		else {
			debugPrint("Unable to get attributes for cell layout at \(itemIndexPath)")
			return nil
		}

		defaultAttributes.center = CGPoint(x: collectionView.frame.width/2, y: collectionView.frame.height/2)
		defaultAttributes.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
		return defaultAttributes
	}

	override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		guard
			let defaultAttributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath),
			let added = addedItem,
			added == itemIndexPath
		else {
			return nil
		}

		return defaultAttributes
	}

	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		guard
			let defaultAttributes = super.layoutAttributesForItem(at: indexPath),
			let collectionView = collectionView
		else {
			debugPrint("Unable to get attributes for cell layout at \(indexPath)")
			return nil
		}
		defaultAttributes.center = CGPoint(x: collectionView.frame.width/2, y: collectionView.frame.height/2)
		defaultAttributes.frame = collectionView.frame
		return defaultAttributes
	}
}
