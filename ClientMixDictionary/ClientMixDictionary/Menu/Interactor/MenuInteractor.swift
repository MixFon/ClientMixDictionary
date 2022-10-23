//
//  MenuInteractor.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.10.2022.
//

import Foundation

protocol _MenuInteractor {
	func makeMenu()
}

final class MenuInteractor: _MenuInteractor {
	
	var presenter: _MenuPresenter?
	
	init(presenter: _MenuPresenter?) {
		self.presenter = presenter
	}
	
	func makeMenu() {
		self.presenter?.buildMenu()
	}
}
