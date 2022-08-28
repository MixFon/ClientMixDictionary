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
	func buildMenu()
	
	func buildChoseLogin()
	func buildLoginEnteryEmail()
	func buildLoginEnteryPassword()
	func buildLoginEnteryPhone()
	func buildLoginEnteryCode()
	
	func buildChoseRegistration()
	func buildRegistrationEnteryEmail()
	func buildRegistrationEnteryPassword()
	func buildRegistrationEnteryConfirm()
	func buildRegistrationEnteryPhone()
	func buildRegistrationEnteryCode()
	
	func buildError(response: LoginModel.Response.Info)
	func buildSuccess(response: LoginModel.Response.Info)
}

final class LoginPresenter: _LoginPresenter {
	
	weak var controller: _LoginController?
	
	init(controller: _LoginController?) {
		self.controller = controller
	}
	
	// MARK: Start menu
	/// Меню выбора регистрация или вход в систему
	func buildMenu() {
		let helper = MenuHelper()
		helper.choseLogin = Command {
			self.buildChoseLogin()
		}
		helper.choseRegistration = Command {
			self.buildChoseRegistration()
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	// MARK: Login
	/// Выбор способа входа в систему
	func buildChoseLogin() {
		let helper = OptionsLoginHelper()
		helper.onEmail = Command {
			self.buildLoginEnteryEmail()
		}
		helper.onPhone = Command {
			self.buildLoginEnteryPhone()
		}
		helper.onBack = Command {
			self.buildMenu()
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildLoginEnteryEmail() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Login"
		helper.placeholder = "Enter email"
		helper.onBack = Command {
			self.buildChoseLogin()
		}
		helper.onNext = Command { email in
			self.controller?.checkLoginState(viewModel: .login(email))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildLoginEnteryPassword() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Password"
		helper.placeholder = "Enter password"
		helper.onBack = Command {
			self.buildLoginEnteryEmail()
		}
		helper.onNext = Command { password in
			self.controller?.checkLoginState(viewModel: .password(password))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildLoginEnteryPhone() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Phone"
		helper.placeholder = "Enter your phone number"
		helper.onBack = Command {
			self.buildChoseLogin()
		}
		helper.onNext = Command { phone in
			self.controller?.checkLoginState(viewModel: .phone(phone))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildLoginEnteryCode() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Code"
		helper.placeholder = "Enter the code from the sms"
		helper.onBack = Command {
			self.buildLoginEnteryPhone()
		}
		helper.onNext = Command { phone in
			self.controller?.checkLoginState(viewModel: .code(phone))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	
	// MARK: Registration
	/// Выбор способа регистрации
	func buildChoseRegistration() {
		let helper = OptionsRegistrationHelper()
		helper.onBack = Command {
			self.buildMenu()
		}
		helper.onPhone = Command {
			self.buildRegistrationEnteryPhone()
		}
		helper.onEmail = Command {
			self.buildRegistrationEnteryEmail()
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildRegistrationEnteryEmail() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Login"
		helper.placeholder = "Enter email"
		helper.onBack = Command {
			self.buildChoseRegistration()
		}
		helper.onNext = Command { email in
			self.controller?.checkRegistrationState(viewModel: .login(email))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildRegistrationEnteryPassword() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Password"
		helper.placeholder = "Enter password"
		helper.onBack = Command {
			self.buildRegistrationEnteryEmail()
		}
		helper.onNext = Command { password in
			self.controller?.checkRegistrationState(viewModel: .password(password))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildRegistrationEnteryConfirm() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Confirm password"
		helper.placeholder = "Enter password"
		helper.onBack = Command {
			self.buildRegistrationEnteryPassword()
		}
		helper.onNext = Command { password in
			self.controller?.checkRegistrationState(viewModel: .confirm(password))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildRegistrationEnteryPhone() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Phone"
		helper.placeholder = "Enter your phone number"
		helper.onBack = Command {
			self.buildChoseRegistration()
		}
		helper.onNext = Command { code in
			self.controller?.checkRegistrationState(viewModel: .code(code))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildRegistrationEnteryCode() {
		let helper = FieldHelper()
		helper.text = nil
		helper.title = "Code"
		helper.placeholder = "Enter the code from the sms"
		helper.onBack = Command {
			self.buildChoseRegistration()
		}
		helper.onNext = Command { code in
			self.controller?.checkRegistrationState(viewModel: .code(code))
		}
		let state = helper.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [state])
		self.controller?.showState(viewModel: viewModel)
	}
	
	// MARK: Info
	// Создание ячейки ошибки.
	func buildError(response: LoginModel.Response.Info) {
		let helperError = InfoHelper()
		helperError.infoImage = UIImage.init(systemName: "xmark")
		helperError.imageColor = .systemRed
		helperError.font = .systemFont(ofSize: 17)
		
		helperError.text = response.message
		helperError.onSelect = Command {
			response.onClose?.perform(with: ())
		}
		
		let erroeState = helperError.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [erroeState])
		self.controller?.showState(viewModel: viewModel)
	}
	
	func buildSuccess(response: LoginModel.Response.Info) {
		let helperError = InfoHelper()
		helperError.infoImage = UIImage.init(systemName: "checkmark")
		helperError.imageColor = .systemGreen
		helperError.font = .systemFont(ofSize: 17)
		
		helperError.text = response.message
		helperError.onSelect = Command {
			response.onClose?.perform(with: ())
		}
		
		let erroeState = helperError.makeState()
		let viewModel = LoginModel.ViewModel.Show(states: [erroeState])
		self.controller?.showState(viewModel: viewModel)
	}
	
}
