//
//  String+Format.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

enum PriceFormatLocation {
	case header
	case summaryCard
}

extension String {


	// TODO Populates constants - Low Priority

	private enum Constant {
		static let headerPricePoundFormatSize: CGFloat = 38.0
		static let headerPricePoundKern: CGFloat = -0.21
		static let headerPriceFormatWeight: UIFont.Weight = .semibold

		static let summaryPriceFormatSize: CGFloat = 34.0
		static let summaryPricePoundKern: CGFloat = -0.18
		static let summaryPriceFormatWeight: UIFont.Weight = .bold

	}

	func formatPrice(for location: PriceFormatLocation) -> NSAttributedString {
		switch location {
		case .header:
			return formatPriceForHeader()
		case .summaryCard:
			return formatPriceForSummary()
		}
	}

	private func formatPriceForHeader() -> NSAttributedString {
		let attributedString = NSMutableAttributedString(string: "£1,720.21", attributes: [
			.font: UIFont.systemFont(ofSize: 38.0, weight: .semibold),
			.foregroundColor: UIColor.black,
			.kern: 0.0
			])
		attributedString.addAttributes([
			.font: UIFont.systemFont(ofSize: 38.0, weight: .bold),
			.kern: -0.21
			], range: NSRange(location: 0, length: 1))
		attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40.0, weight: .semibold), range: NSRange(location: 6, length: 1))
		attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 34.0, weight: .semibold), range: NSRange(location: 7, length: 2))
//		let attributedString = NSMutableAttributedString(
//			string: self,
//			attributes: [
//				.font: UIFont.systemFont(
//					ofSize: Constant.headerPricePoundFormatSize,
//					weight: Constant.headerPriceFormatWeight
//				),
//				.foregroundColor: UIColor.black,
//				.kern: 0.0
//			]
//		)
//		attributedString.addAttributes([
//				.font: UIFont.TextStyle.body,
//				.kern: Constant.headerPricePoundKern
//			],
//			range: NSRange(location: 0, length: 1))
//		attributedString.addAttribute(
//			.font,
//			value: UIFont.systemFont(
//				ofSize: 40.0,
//				weight: Constant.headerPriceFormatWeight
//			),
//			range: NSRange(location: 6, length: 1)
//		)
//		attributedString.addAttribute(
//			.font,
//			value: UIFont.systemFont(
//				ofSize: 34.0,
//				weight: Constant.headerPriceFormatWeight
//			),
//			range: NSRange(location: 7, length: 2)
//		)
		return attributedString
	}

	private func formatPriceForSummary() -> NSAttributedString {
		let attributedString = NSMutableAttributedString(
			string: self,
			attributes: [
				.font: UIFont.systemFont(ofSize: 34.0, weight: .bold),
				.foregroundColor: UIColor.black,
				.kern: -0.18
			]
		)
		attributedString.addAttributes([
				.font: UIFont.systemFont(ofSize: 25.0, weight: .bold),
				.kern: -0.2
			],
			range: NSRange(location: 0, length: 1)
		)
		attributedString.addAttributes([
			.font: UIFont.systemFont(ofSize: 32.0, weight: .bold),
			.kern: -0.17
			],
			range: NSRange(location: 7, length: 1)
		)
		attributedString.addAttributes([
			.font: UIFont.systemFont(ofSize: 28.0, weight: .bold),
			.kern: -0.16
			],
			range: NSRange(location: 8, length: 1)
		)
		return attributedString
	}
}
