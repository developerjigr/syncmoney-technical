//
//  ViewController.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

import UIKit

class UserAccountSummaryViewController: UIViewController {

	//Should ideally be a table view with collection view nibs as cells
	@IBOutlet var scrollView: UIScrollView!
	@IBOutlet var headerViewContainer: UIView!
	@IBOutlet var syncAccountCollectionViewContainer: UIView!
	@IBOutlet var bankAccountCollectionViewContainer: UIView!

	weak var summaryHeaderView: UserSummaryHeaderView?
	weak var syncAccountCollection: UserAccountSummaryCollectionView?
	weak var bankAccountCollection: UserAccountSummaryCollectionView?

	var viewModel: UserAccountSummaryViewModel? {
		didSet {
			viewModel?.delegate = self
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupSyncAccountCollectionView()
	}

	func setupSyncAccountCollectionView() {
		guard
			let headerViewNib = UserSummaryHeaderView.loadFromNib(),
			let syncCollectionViewNib = UserAccountSummaryCollectionView.loadFromNib(),
			let bankCollectionViewNib = UserAccountSummaryCollectionView.loadFromNib()
		else {
			fatalError("Problem loading UserAccountSummaryCollectionView nib")
		}


		headerViewNib.configureView()
		syncCollectionViewNib.configureView(for: .syncAccount)
		bankCollectionViewNib.configureView(for: .bankAccount)

		headerViewNib.addToSubviewAndEmbed(into: headerViewContainer)
		syncCollectionViewNib.addToSubviewAndEmbed(into: syncAccountCollectionViewContainer)
		bankCollectionViewNib.addToSubviewAndEmbed(into: bankAccountCollectionViewContainer)

		summaryHeaderView = headerViewNib
		syncAccountCollection = syncCollectionViewNib
		bankAccountCollection = bankCollectionViewNib

	}


}

extension UserAccountSummaryViewController: UserAccountSummaryDelegate {

	func accountDidLoad(_ viewModel: UserAccountSummaryViewModel, syncAccountViewData: [SyncAccountViewData]) {
		// pass in syncViewData
		syncAccountCollection?.configureView(for: .syncAccount)
	}

	func accountDidLoad(_ viewModel: UserAccountSummaryViewModel, bankAccountViewData: [BankAccountViewData]) {
		// pass in bankViewData
		bankAccountCollection?.configureView(for: .bankAccount)
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

