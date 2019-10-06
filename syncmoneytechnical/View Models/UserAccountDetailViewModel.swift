//
//  UserAccountDetailViewModel.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit

protocol UserAccountDetailDelegate: class {
	func accountDidLoad(_ viewModel: UserAccountDetailViewModel, syncAccountViewData: SyncAccountViewData)
	func accountDidLoad(_ viewModel: UserAccountDetailViewModel, bankAccountViewData: BankAccountViewData)

	func didSelectTransaction(_ viewModel: UserAccountDetailViewModel, atIndexPath: IndexPath)
}

struct SyncAccountViewData {
	let currency: String
	let totalAmount: CGFloat
	let formattedTotal: String
	let accountName: String
	let image_url: String
}

struct BankAccountViewData {
	let currency: String
	let totalAmount: CGFloat
	let formattedTotal: String
	let accountName: String
	let image_url: String
}

class UserAccountDetailViewModel {

	weak var delegate: UserAccountDetailDelegate?
	let apiProvider: APIServiceProtocol?

	let accountModel: AccountModel?
	let accountType: AccountType?

	init(
		with account: SelectedAccount,
		delegate: UserAccountDetailDelegate,
		apiProvider: APIServiceProtocol = APIService.shared
	) {
		self.accountModel = account.model
		self.accountType = account.type
		self.delegate = delegate
		self.apiProvider = apiProvider
	}

}


