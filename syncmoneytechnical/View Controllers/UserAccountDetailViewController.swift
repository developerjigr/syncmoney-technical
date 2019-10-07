//
//  UserAccountDetailViewController.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import Foundation
import UIKit


class UserAccountDetailViewController: UIViewController {

	var viewModel: UserAccountDetailViewModel? {
		didSet {
			// TODO: LOAD TRANSACTIONS
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()

	}

}

extension UserAccountDetailViewController: UserAccountDetailDelegate {

	func accountDidLoad(_ viewModel: UserAccountDetailViewModel, syncAccountViewData: SyncAccountViewData) {
		//Load Sync Specific View Data
	}

	func accountDidLoad(_ viewModel: UserAccountDetailViewModel, bankAccountViewData: BankAccountViewData) {
		//Load Bank Account Specific View Data
	}

	func didSelectTransaction(_ viewModel: UserAccountDetailViewModel, atIndexPath: IndexPath) {
		// Select transaction -> go to more --- NOT IMPLEMENTED
	}


}
