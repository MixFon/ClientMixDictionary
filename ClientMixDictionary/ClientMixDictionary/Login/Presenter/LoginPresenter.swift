//
//  LoginPresenter.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import CoreTableView

protocol _LoginPresenter {
	func makeLogin()
	func makeMenu(response: LoginModel.Response.Menu)
	func makeChoseLogin(response: LoginModel.Response.ChoseLogin)
}

final class LoginPresenter: _LoginPresenter {
	
	weak var controller: _LoginController?
	
	init(controller: _LoginController?) {
		self.controller = controller
	}
	
	func makeLogin() {
		let helper = FieldHelper()
		helper.title = "Login"
		helper.placeholder = "Enter login"
		helper.onNext = Command { text in
			print(text)
		}
		helper.onBack = Command {
			print("Back")
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func makeMenu(response: LoginModel.Response.Menu) {
		let helper = MenuHelper()
		helper.actions = response
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func makeChoseLogin(response: LoginModel.Response.ChoseLogin) {
		print(123)
		let helper = ChoseLoginHelper()
		helper.actions = response
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
}
