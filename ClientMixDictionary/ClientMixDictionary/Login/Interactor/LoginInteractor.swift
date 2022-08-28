//
//  LoginInteractor.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import CoreTableView

protocol _LoginInteractor {
	func makeMenu()
	
	func checkLoginEnteredEmail(email: String?)
	func checkLoginEnteredPassword(password: String?)
	func checkLoginEnteredPhone(phone: String?)
	func checkLoginEnteredCode(code: String?)
	
	func checkRegistrationEnteredEmail(email: String?)
	func checkRegistrationEnteredPassword(password: String?)
	func checkRegistrationEnteredConfirm(confirm: String?)
	func checkRegistrationEnteredPhone(phone: String?)
	func checkRegistrationEnteredCode(code: String?)
}

protocol _LoginDataStore {
	var credentials: Credentials? { get }
}

final class LoginInteractor: _LoginInteractor, _LoginDataStore {

	
	private var presenter: _LoginPresenter?
	
	var credentials: Credentials? = .init()
	
	init(presenter: _LoginPresenter?) {
		self.presenter = presenter
	}
	
	// MARK: Start menu
	/// Создает действия для стартового меню.
	func makeMenu() {
		self.presenter?.buildMenu()
	}
	
	// MARK: Login
	func checkLoginEnteredEmail(email: String?) {
		let check = [true, false]
		if check.randomElement()! {
			self.credentials?.email = email
			self.presenter?.buildLoginEnteryPassword()
		} else {
			let response = LoginModel.Response.Info(
				message: "Error email!",
				onClose: Command {
					self.presenter?.buildLoginEnteryEmail()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	func checkLoginEnteredPassword(password: String?) {
		let check = [true, false]
		if check.randomElement()! {
			self.credentials?.password = password
			dump(self.credentials)
			let response = LoginModel.Response.Info(
				message: "Success password!",
				onClose: Command {
					self.presenter?.buildLoginEnteryPassword()
				}
			)
			self.presenter?.buildSaccess(response: response)
		} else {
			let response = LoginModel.Response.Info(
				message: "Error password!",
				onClose: Command {
					self.presenter?.buildLoginEnteryPassword()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	func checkLoginEnteredPhone(phone: String?) {
		let check = [true, false]
		if check.randomElement()! {
			self.credentials?.phone = phone
			self.presenter?.buildLoginEnteryCode()
		} else {
			let response = LoginModel.Response.Info(
				message: "Error phone!",
				onClose: Command {
					self.presenter?.buildLoginEnteryPhone()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	func checkLoginEnteredCode(code: String?) {
		let check = [true, false]
		if check.randomElement()! {
			dump(self.credentials)
			let response = LoginModel.Response.Info(
				message: "Success code!",
				onClose: Command {
					self.presenter?.buildLoginEnteryPhone()
				}
			)
			self.presenter?.buildSaccess(response: response)
		} else {
			let response = LoginModel.Response.Info(
				message: "Error phone!",
				onClose: Command {
					self.presenter?.buildLoginEnteryPhone()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	// MARK: Registration
	func checkRegistrationEnteredEmail(email: String?) {
		let check = [true, false]
		if check.randomElement()! {
			self.credentials?.email = email
			self.presenter?.buildRegistrationEnteryPassword()
		} else {
			let response = LoginModel.Response.Info(
				message: "Error email!",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryEmail()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	func checkRegistrationEnteredPassword(password: String?) {
		let check = [true, false]
		if check.randomElement()! {
			self.credentials?.password = password
			self.presenter?.buildRegistrationEnteryConfirm()
		} else {
			let response = LoginModel.Response.Info(
				message: "Error password!",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryPassword()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	func checkRegistrationEnteredConfirm(confirm: String?) {
		let check = [true, false]
		if check.randomElement()! {
			dump(self.credentials)
			let response = LoginModel.Response.Info(
				message: "Success password!",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryConfirm()
				}
			)
			self.presenter?.buildSaccess(response: response)
		} else {
			let response = LoginModel.Response.Info(
				message: "Error password!",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryConfirm()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	func checkRegistrationEnteredPhone(phone: String?) {
		let check = [true, false]
		if check.randomElement()! {
			self.credentials?.phone = phone
			self.presenter?.buildRegistrationEnteryCode()
		} else {
			let response = LoginModel.Response.Info(
				message: "Error password!",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryPhone()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
	
	func checkRegistrationEnteredCode(code: String?) {
		let check = [true, false]
		if check.randomElement()! {
			dump(self.credentials)
			let response = LoginModel.Response.Info(
				message: "Success code!",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryPhone()
				}
			)
			self.presenter?.buildSaccess(response: response)
		} else {
			let response = LoginModel.Response.Info(
				message: "Error password!",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryPhone()
				}
			)
			self.presenter?.buildError(response: response)
		}
	}
}
