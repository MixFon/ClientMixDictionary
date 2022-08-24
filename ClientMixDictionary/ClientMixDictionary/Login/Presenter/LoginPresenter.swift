//
//  LoginPresenter.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import CoreTableView
import UIKit

protocol _LoginPresenter {
	func buildMenu(response: LoginModel.Response.Menu)
	
	func buildChoseLogin(response: LoginModel.Response.ChoseLogin)
	
	func buildChoseRegistration(response: LoginModel.Response.ChoseLogin)
	
	func buildEnteryCredentials(response: LoginModel.Response.EntryCredentials)
}

final class LoginPresenter: _LoginPresenter {

	
	weak var controller: _LoginController?
	
	init(controller: _LoginController?) {
		self.controller = controller
	}
	
	// MARK: Start menu
	/// Меню выбора регистрация или вход в систему
	func buildMenu(response: LoginModel.Response.Menu) {
		let helper = MenuHelper()
		helper.actions = response
		let state = helper.makeState()
		
		let helperError = InfoHelper()
		helperError.infoImage = UIImage.init(systemName: "xmark")
		helperError.imageColor = .systemRed
		
		helperError.text = "Error message!"
		helperError.font = .systemFont(ofSize: 17)
		
		helperError.onSelect = Command {
			print("onSelect")
		}
		
		let erroeState = helperError.makeState()
		let viewModel = LoginModel.ViewModel(states: [state, erroeState])
		self.controller?.showState(viewModel: viewModel)
	}
	
	// MARK: Menu
	/// Выбор способа входа в систему
	func buildChoseLogin(response: LoginModel.Response.ChoseLogin) {
		let helper = OptionsLoginHelper()
		helper.actions = response
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}

	
	// MARK: Registration
	/// Выбор способа регистрации
	func buildChoseRegistration(response: LoginModel.Response.ChoseLogin) {
		let helper = OptionsRegistrationHelper()
		helper.actions = response
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	// MARK: Entry states
	func buildEnteryCredentials(response: LoginModel.Response.EntryCredentials) {
		let helper = FieldHelper()
		helper.actions = response
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
}
