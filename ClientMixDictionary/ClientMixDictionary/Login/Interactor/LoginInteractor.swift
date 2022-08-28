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
	
	private var autentification: _Authentications? = AuthFirebaseAdapter()
	
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
		self.credentials?.email = email
		self.presenter?.buildLoginEnteryPassword()
	}
	
	func checkLoginEnteredPassword(password: String?) {
		self.credentials?.password = password
		guard
			let email = self.credentials?.email,
			let password = self.credentials?.password
		else {
			return
		}
		self.autentification?.signIn(withEmail: email, password: password, completion: { result in
			switch result {
			case .success(_):
				let response = LoginModel.Response.Info(
					message: "Login!",
					onClose: Command {
						self.presenter?.buildMenu()
					}
				)
				self.presenter?.buildSuccess(response: response)
			case .failure(let error):
				print(error.localizedDescription)
				let response = LoginModel.Response.Info(
					message: error.localizedDescription,
					onClose: Command {
						self.presenter?.buildLoginEnteryPassword()
					}
				)
				self.presenter?.buildError(response: response)
			}
		})
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
			self.presenter?.buildSuccess(response: response)
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
		self.credentials?.email = email
		self.presenter?.buildRegistrationEnteryPassword()
	}
	
	func checkRegistrationEnteredPassword(password: String?) {
		self.credentials?.password = password
		self.presenter?.buildRegistrationEnteryConfirm()
	}
	
	func checkRegistrationEnteredConfirm(confirm: String?) {
		self.credentials?.confirm = confirm
		guard let email = self.credentials?.email,
			  let password = self.credentials?.password,
			  let confirm = self.credentials?.confirm
		else {
			return
		}
		if password != confirm {
			let response = LoginModel.Response.Info(
				message: "Passwords are not equal.",
				onClose: Command {
					self.presenter?.buildRegistrationEnteryPassword()
				}
			)
			self.presenter?.buildError(response: response)
		} else {
			self.autentification?.signUp(withEmail: email, password: password, completion: { result in
				switch result {
				case .success(_):
					let response = LoginModel.Response.Info(
						message: "User \(email) created!",
						onClose: Command {
							self.presenter?.buildMenu()
						}
					)
					self.presenter?.buildSuccess(response: response)
				case .failure(let error):
					print(error.localizedDescription)
					let response = LoginModel.Response.Info(
						message: error.localizedDescription,
						onClose: Command {
							self.presenter?.buildRegistrationEnteryPassword()
						}
					)
					self.presenter?.buildError(response: response)
				}
			})
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
			self.presenter?.buildSuccess(response: response)
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
