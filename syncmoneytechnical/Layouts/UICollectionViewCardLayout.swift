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

	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		guard let attributes = super.layoutAttributesForElements(in: rect) else {
			fatalError("Unable to get attribures for elements of collectionview")
		}
		return attributes.map { attribute in
			var cellAttribute = attribute
			if cellAttribute.representedElementCategory == .cell {
				let indexPath = cellAttribute.indexPath
				cellAttribute = self.layoutAttributesForItem(at:indexPath)!
			}
			return cellAttribute
		}
	}

	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		guard
			let defaultAttributes = super.layoutAttributesForItem(at: indexPath)?.copy() as? UICollectionViewLayoutAttributes,
			let collectionView = collectionView
		else {
			debugPrint("Unable to get attributes for cell layout at \(indexPath)")
			return nil
		}

		let cellOriginPoint = CGPoint(
			x: collectionView.frame.origin.x + (collectionView.frame.width * CGFloat(indexPath.row)),
			y: collectionView.frame.origin.y
		)

		let newCellSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)

		defaultAttributes.center = CGPoint(x: collectionView.frame.width/2, y: collectionView.frame.height/2)
		defaultAttributes.frame = CGRect(origin: cellOriginPoint, size: newCellSize)

		return defaultAttributes
	}
}
