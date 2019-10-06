//
//  UserAccountSummaryViewModel.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation

enum AccountType: String {
	case bankAccount
	case syncAccount
}

struct SelectedAccount {
	let model: AccountModel
	let type: AccountType
}

struct UserAccountViewData {
	let syncAccounts: [SyncAccountViewData]
	let bankAccounts: [BankAccountViewData]
}

protocol UserAccountSummaryDelegate: class {
	func accountDidLoad(_ viewModel: UserAccountSummaryViewModel, syncAccountViewData: [SyncAccountViewData])
	func accountDidLoad(_ viewModel: UserAccountSummaryViewModel, bankAccountViewData: [BankAccountViewData])

	func didSelectAccount(_ viewModel: UserAccountSummaryViewModel, atIndexPath: IndexPath)
}

class UserAccountSummaryViewModel {

	let apiProvider: APIServiceProtocol?

	weak var delegate: UserAccountSummaryDelegate? {
		didSet {
			initialFetch()
		}
	}

	var selectedModel: SelectedAccount?

	var bankAccountModels: [AccountModel]?
	var syncAccountModels: [AccountModel]?

	init(apiProvider: APIServiceProtocol = APIService.shared) {
		self.apiProvider = apiProvider
		initialFetch()
	}

	// Load the user account model -> with the sync and the bank accounts using the api provider.
	func initialFetch() {
		guard
			let apiProvider = apiProvider
		else {
			fatalError("APIProvider not available: UserAccountSummaryViewModel")
		}
		apiProvider.fetchUserAccount { [weak self] (responseStatus, userAccount, error) in
			guard
				let _self = self,
				responseStatus != .failure
			else {
				fatalError("Problem with initial fetch - result in failure")
			}
			_self.bankAccountModels = userAccount.bankAccounts
			_self.syncAccountModels = userAccount.syncAccounts
			if
				responseStatus == .partial,
				error != nil
			{
				debugPrint("Partial Errors received: \(String(describing: error?.localizedDescription))")
			}
		}
	}

	func userAccountViewData() -> UserAccountViewData {
		let bankAccountsVD = bankAccountViewData()
		let syncAccountsVD = syncAccountViewData()

		return UserAccountViewData(
			syncAccounts: syncAccountsVD,
			bankAccounts: bankAccountsVD
		)
	}

	func bankAccountViewData() -> [BankAccountViewData] {
		
		return []
	}

	func syncAccountViewData() -> [SyncAccountViewData] {

		return []
	}

	func getUserData() {

	}

	func selectAccount(at indexPath: IndexPath) {

		//TWO SECTIONS: Section 0 Sync Account, 1 Bank Account


	}

}
