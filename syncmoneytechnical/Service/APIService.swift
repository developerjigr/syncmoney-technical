//
//  APIService.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation


/// Used to determine whether API returned no errors, some errors or a complete fail
enum APIResponseStatus {
	case success
	case partial
	case failure
}

enum APIError: String, Error {
	case noNetwork = "No Network"
	case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {

	typealias AccountResponseCompletion = (
		_ responseStatus: APIResponseStatus,
		_ accounts: UserAccountModel,
		_ error: APIError?
	) -> Void

	typealias TransactionsResponseCompletion = (
		_ responseStatus: APIResponseStatus,
		_ transactions: [TransactionsModel],
		_ error: APIError?
	) -> Void

	func fetchUserAccount(completion: @escaping AccountResponseCompletion)
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

	func fetchUserAccount(
		completion: @escaping AccountResponseCompletion
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

			let userAccount = try! decoder.decode(UserAccountModel.self, from: data)
			completion(.success, userAccount, nil)
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
			completion(.success, account.transactions, nil)
		}
	}


}








