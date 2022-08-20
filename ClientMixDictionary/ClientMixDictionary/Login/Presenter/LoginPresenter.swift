//
//  LoginPresenter.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import CoreTableView

protocol _LoginPresenter {
	func buildMenu(response: LoginModel.Response.Menu)
	func buildChoseLogin(response: LoginModel.Response.ChoseLogin)
	func buildLoginEnteryEmail(response: LoginModel.Response.Login.EntryEmail)
	func buildLoginEnteryPassword(response: LoginModel.Response.Login.EntryPassword)
	func buildLoginEnteryPhone(response: LoginModel.Response.Login.EntryPhone)
	func buildLoginEnteryPhoneCode(response: LoginModel.Response.Login.EntryPhoneCode)
}

final class LoginPresenter: _LoginPresenter {
	
	weak var controller: _LoginController?
	
	init(controller: _LoginController?) {
		self.controller = controller
	}
	
	/// Создание состояния меню выбора регистрация или вход в систему
	func buildMenu(response: LoginModel.Response.Menu) {
		let helper = MenuHelper()
		helper.actions = response
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	/// Создвние состояния выбора способа входа в систему
	func buildChoseLogin(response: LoginModel.Response.ChoseLogin) {
		let helper = OptionsLoginHelper()
		helper.actions = response
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}

	/// Создание состояния ввода  email для входа в систему
	func buildLoginEnteryEmail(response: LoginModel.Response.Login.EntryEmail) {
		let helper = FieldHelper()
		helper.title = "Login"
		helper.placeholder = "Enter email"
		helper.onNext = response.onNext
		helper.onBack = response.onBack
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	/// Создание состояния ввода пародя для входа в систему
	func buildLoginEnteryPassword(response: LoginModel.Response.Login.EntryPassword) {
		let helper = FieldHelper()
		helper.title = "Password"
		helper.placeholder = "Enter password"
		helper.onNext = response.onNext
		helper.onBack = response.onBack
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	/// Создание состояния ввода номера телефона для входа в систему
	func buildLoginEnteryPhone(response: LoginModel.Response.Login.EntryPhone) {
		let helper = FieldHelper()
		helper.title = "Phone"
		helper.placeholder = "Enter your phone number"
		helper.onNext = response.onNext
		helper.onBack = response.onBack
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	/// Создание состояния ввода кода из смс для входа в систему
	func buildLoginEnteryPhoneCode(response: LoginModel.Response.Login.EntryPhoneCode) {
		let helper = FieldHelper()
		helper.title = "Code"
		helper.placeholder = "Enter the code from the sms"
		helper.onNext = response.onNext
		helper.onBack = response.onBack
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
}
