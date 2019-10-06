//
//  TransactionsModel.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation

struct TransactionsModel: Codable {
	let name: String
	let amount: Decimal
	let currency: String
	let type: String
	let image_url: String
	let date: String
}
