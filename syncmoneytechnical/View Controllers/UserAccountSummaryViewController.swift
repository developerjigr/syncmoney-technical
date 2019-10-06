//
//  ViewController.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import UIKit

class UserAccountSummaryViewController: UIViewController {

	var viewModel: UserAccountSummaryViewModel? {
		didSet {
			viewModel?.delegate = self
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}



}

extension UserAccountSummaryViewController: UserAccountSummaryDelegate {

	func accountDidLoad(_ viewModel: UserAccountSummaryViewModel, syncAccountViewData: [SyncAccountViewData]) {

	}

	func accountDidLoad(_ viewModel: UserAccountSummaryViewModel, bankAccountViewData: [BankAccountViewData]) {

	}


	func didSelectAccount(_ viewModel: UserAccountSummaryViewModel, atIndexPath: IndexPath) {

	}




}


// MARK: - Navigation Helper functions

extension UserAccountSummaryViewController {

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard
			let userAccountDetailViewController = segue.destination as? UserAccountDetailViewController,
			let selectedAccountModel = viewModel?.selectedModel
			else {
				return
		}

		let selectedAccountDetailViewModel = UserAccountDetailViewModel(
			with: selectedAccountModel,
			delegate: userAccountDetailViewController
		)

		userAccountDetailViewController.viewModel = selectedAccountDetailViewModel
	}

}

