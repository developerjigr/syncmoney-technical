//
//  UIView+ExtendedView.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 07/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//


import Foundation
import UIKit

extension UIView {

	enum ExtendViewPosition {
		case top
		case bottom
	}

	func addRoundedEdge(desiredCurve: CGFloat?, position: ExtendViewPosition) {

		let offset: CGFloat = self.frame.width / desiredCurve!
		let bounds: CGRect = self.bounds
		let ovalOriginX: CGFloat
		let ovalOriginY: CGFloat

		ovalOriginX = bounds.origin.x

		if position == .top {
			ovalOriginY = -bounds.maxY / 2.0
		} else {
			ovalOriginY = bounds.origin.y
		}

		let rectBounds: CGRect = CGRect(
			x: bounds.origin.x,
			y: bounds.origin.y,
			width: bounds.size.width,
			height: bounds.size.height / 2
		)

		let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)

		let ovalBounds: CGRect = CGRect(
			x: ovalOriginX - offset / 2,
			y: ovalOriginY,
			width: bounds.size.width + offset,
			height: bounds.size.height
		)
		let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
		rectPath.append(ovalPath)

		// Create the shape layer and set its path
		let maskLayer: CAShapeLayer = CAShapeLayer()
		maskLayer.frame = bounds
		maskLayer.path = rectPath.cgPath

		UIColor.yellow.setFill()
		rectPath.fill()

		// Set the newly created shape layer as the mask for the view's layer
		self.layer.mask = maskLayer

	}

}
