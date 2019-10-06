//
//  AccountModel.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation

struct AccountModel: Codable {
	let id: Int
	let provider: String
	let accountName: String
	let locale: String
	let sortcode: String
	let accountNumber: String
	let balance: Decimal
	let transactions: [TransactionsModel]
}
