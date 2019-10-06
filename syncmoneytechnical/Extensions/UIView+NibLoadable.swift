//
//  UIView+NibLoadable.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable {}

extension NibLoadable where Self: UIView {

	static func loadFromNib() -> Self? {
		let nibName = String(describing: self)
		let bundle = Bundle.main
		let nib = UINib(nibName: nibName, bundle: bundle)
		return nib.instantiate(withOwner: self, options: nil).first as? Self
	}

}
