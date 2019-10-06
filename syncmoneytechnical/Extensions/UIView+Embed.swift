//
//  UIView+Embed.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import UIKit

extension UIView {

	func addToSubviewAndEmbed(into parentView: UIView) {
		parentView.addSubview(self)
		self.embed(into: parentView)
	}

	func embed(into parentView: UIView) {
		self.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			topAnchor.constraint(equalTo: parentView.topAnchor),
			bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
			leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
			trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
		])
	}

}
