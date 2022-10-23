//
//  MenuPresenter.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.10.2022.
//

import Foundation

protocol _MenuPresenter {
	func buildMenu()
}

final class MenuPresenter: _MenuPresenter {
	
	weak var controller: _MenuController?

	init(controller: _MenuController?) {
		self.controller = controller
	}
	
	func buildMenu() {
		let menuHelper = MenuHelper()
		let menuState = menuHelper.makeState()
		
		let show = MenuModel.ViewModel.Show(states: [menuState])
		self.controller?.showStates(show: show)
	}
}
