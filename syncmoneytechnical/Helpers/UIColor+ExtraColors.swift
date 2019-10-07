//
//  UIColor+ExtraColors.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 07/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

	convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
		self.init(
			displayP3Red: r/255,
			green: g/255,
			blue: b/255,
			alpha: 1
		)
	}

	class var headerColor: UIColor {
		return UIColor.init(
			r: 251,
			g: 64,
			b: 107
		)
	}

	class var bodyColor: UIColor {
		return UIColor.init(
			r: 215,
			g: 215,
			b: 215
		)
	}
}
