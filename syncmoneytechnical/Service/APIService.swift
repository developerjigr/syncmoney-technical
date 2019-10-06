//
//  APIService.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation

enum APIError: String, Error {
	case noNetwork = "No Network"
	case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {
	typealias AccountsResponseCompletion = (_ success: Bool, _ accounts: [AccountModel], _ error: APIError?) -> Void
	typealias TransactionsResponseCompletion = (_ success: Bool, _ transactions: [TransactionsModel], _ error: APIError?) -> Void

	func fetchUserAccounts(completion: @escaping AccountsResponseCompletion)
	func fetchTransactions(forAccount id: String, completion: @escaping TransactionsResponseCompletion)
}

class APIService: APIServiceProtocol {

	enum Constant {
		static let resource: String = "content"
		static let resourceType: String = "json"
		static let decodingStrategy: JSONDecoder.DateDecodingStrategy = .iso8601
	}

	static let shared = APIService()

	private init() {
		print("APIService Initialized...")
	}

	func fetchUserAccounts(
		completion: @escaping AccountsResponseCompletion
	) {
		DispatchQueue.global().async {
			sleep(1) // Simulating API Response time
			let path = Bundle.main.path(
				forResource: Constant.resource,
				ofType: Constant.resourceType
			)!

			let data = try! Data(contentsOf: URL(fileURLWithPath: path))
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = Constant.decodingStrategy

			let userAccount = try! decoder.decode(UserAccountsModel.self, from: data)
			completion(true, userAccount.accounts, nil)
		}
	}

	func fetchTransactions(
		forAccount id: String,
		completion: @escaping TransactionsResponseCompletion
	) {
		DispatchQueue.global().async {
//			sleep(0.25) // Simulating API Response time
			let path = Bundle.main.path(
				forResource: Constant.resource,
				ofType: Constant.resourceType
			)!

			let data = try! Data(contentsOf: URL(fileURLWithPath: path))
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = Constant.decodingStrategy

			let account = try! decoder.decode(AccountModel.self, from: data)
			completion(true, account.transactions, nil)
		}
	}


}








