//
//  ViewDataConfigurable.swift
//  syncmoneytechnical
//
//  Created by Jigar Polra on 06/10/2019.
//  Copyright © 2019 JIG_R. All rights reserved.
//

protocol ViewData {}

/// Views which values are populated via ViewData
protocol ViewDataConfigurable {
	associatedtype ViewDataType = ViewData

	func configureView(with viewData: ViewDataType)
}
