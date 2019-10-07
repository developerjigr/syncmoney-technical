//
//  UIImageView+RoundFrame.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 07/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import UIKit

extension UIImageView {

	func roundedFrame() {
		self.layer.cornerRadius = self.frame.width / 2
		self.layer.masksToBounds = true
		self.clipsToBounds = true
	}
}

