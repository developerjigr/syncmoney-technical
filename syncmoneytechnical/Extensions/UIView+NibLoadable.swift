//
//  UIView+NibLoadable.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable {
	 static var nibNameIdentifier: String { get }
}

extension NibLoadable where Self: UIView {

	static var nibNameIdentifier: String {
		return String(describing: self)
	}

	static func loadFromNib() -> Self? {
		let nibName = Self.nibNameIdentifier
		let bundle = Bundle.main
		let nib = UINib(nibName: nibName, bundle: bundle)
		return nib.instantiate(withOwner: self, options: nil).first as? Self
	}

}
