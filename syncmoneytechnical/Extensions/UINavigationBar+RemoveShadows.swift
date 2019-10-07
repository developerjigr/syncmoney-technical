//
//  UINavigationBar+RemoveShadows.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {

	func removeShadowBorder() {
		self.setBackgroundImage(UIImage(), for:.default)
		self.shadowImage = UIImage()
		self.layoutIfNeeded()
	}

	func restoreShadowBorder() {
		self.setBackgroundImage(nil, for:.default)
		self.shadowImage = nil
		self.layoutIfNeeded()
	}

}
