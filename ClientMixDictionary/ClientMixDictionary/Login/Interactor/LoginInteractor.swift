//
//  LoginInteractor.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import CoreTableView

protocol _LoginInteractor {
	func makeMenu(request: LoginModel.Request)
	func makeLoginOptions(request: LoginModel.Request)
	func makeLoginEnteryEmail(request: LoginModel.Request)
	func makeLoginEnteryPassword(request: LoginModel.Request)
	func makeLoginEnteryPhone(request: LoginModel.Request)
	func makeLoginEnteryPhoneCode(request: LoginModel.Request)
	
	func makeRegistrationOptions(request: LoginModel.Request)
	func makeRegistrationEnteryEmail(request: LoginModel.Request)
	func makeRegistrationEnteryPassword(request: LoginModel.Request)
	func makeRegistrationEnteryConfirmPassword(request: LoginModel.Request)
	func makeRegistrationEnteryPhone(request: LoginModel.Request)
	func makeRegistrationEnteryPhoneCode(request: LoginModel.Request)
}

protocol _LoginDataStore {
	var credentials: Credentials? { get }
}

final class LoginInteractor: _LoginInteractor, _LoginDataStore {
	
	private var presenter: _LoginPresenter?
	
	var credentials: Credentials?
	
	init(presenter: _LoginPresenter?) {
		self.presenter = presenter
	}
	
	// MARK: Start menu
	/// Создает действия для стартового меню.
	func makeMenu(request: LoginModel.Request) {
		let response = LoginModel.Response.Menu(
			onLogin: Command {
				print("Menu")
				self.makeLoginOptions(request: .init())
			},
			onRegistration: Command {
				print("REG")
				self.makeRegistrationOptions(request: .init())
			}
		)
		self.presenter?.buildMenu(response: response)
	}
	
	// MARK: Login
	/// Выбор способа входа в систему.
	func makeLoginOptions(request: LoginModel.Request) {
		let response = LoginModel.Response.ChoseLogin(
			onBack: Command {
				self.makeMenu(request: .init())
			},
			onEmail: Command {
				self.makeLoginEnteryEmail(request: .init())
			},
			onPhone: Command {
				self.makeLoginEnteryPhone(request: .init())
			}
		)
		self.presenter?.buildChoseLogin(response: response)
	}
	
	/// Ввод email при входе в систему.
	func makeLoginEnteryEmail(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			text: nil,
			title: "Login",
			placeholder: "Enter email",
			onBack: Command {
				self.makeLoginOptions(request: .init())
			},
			onNext: Command { enteredEmail in
				self.makeLoginEnteryPassword(request: .init())
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	/// Ввод пароля при входе в систему.
	func makeLoginEnteryPassword(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			text: nil,
			title: "Password",
			placeholder: "Enter password",
			onBack: Command {
				self.makeLoginEnteryEmail(request: .init())
			},
			onNext: Command { enteredPassword in
				print("Finish login")
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	/// Ввод номера телефона при входе в систему.
	func makeLoginEnteryPhone(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			text: nil,
			title: "Phone",
			placeholder: "Enter your phone number",
			onBack: Command {
				self.makeLoginOptions(request: .init())
			},
			onNext: Command { enteredPassword in
				self.makeLoginEnteryPhoneCode(request: .init())
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	/// Ввод кода из смс при входе в систему.
	func makeLoginEnteryPhoneCode(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			text: nil,
			title: "Code",
			placeholder: "Enter the code from the sms",
			onBack: Command {
				self.makeLoginEnteryPhone(request: .init())
			},
			onNext: Command { enteredPassword in
				print("Finish entry code")
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	// MARK: Registration
	/// Выбор способа регистрации
	func makeRegistrationOptions(request: LoginModel.Request) {
		let response = LoginModel.Response.ChoseLogin(
			onBack: Command {
				self.makeMenu(request: .init())
			},
			onEmail: Command {
				self.makeRegistrationEnteryEmail(request: .init())
			},
			onPhone: Command {
				self.makeRegistrationEnteryPhone(request: .init())
			}
		)
		self.presenter?.buildChoseRegistration(response: response)
	}
	
	/// Ввод email при регистрации.
	func makeRegistrationEnteryEmail(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			text: nil,
			title: "Login",
			placeholder: "Enter email",
			onBack: Command {
				self.makeRegistrationOptions(request: .init())
			},
			onNext: Command { enteredEmail in
				self.makeRegistrationEnteryPassword(request: .init())
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	/// Ввод пароля при регистрации.
	func makeRegistrationEnteryPassword(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			title: "Password",
			placeholder: "Enter password",
			onBack: Command {
				self.makeRegistrationEnteryEmail(request: .init())
			},
			onNext: Command { enteredPassword in
				self.makeRegistrationEnteryConfirmPassword(request: .init())
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	/// Ввод пароля подтверждения при регистрации.
	func makeRegistrationEnteryConfirmPassword(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			title: "Confirm password",
			placeholder: "Enter password",
			onBack: Command {
				self.makeRegistrationEnteryPassword(request: .init())
			},
			onNext: Command { enteredPassword in
				print("Finish confimr password")
				//self.makeRegistrationEnteryConfirmPassword(request: .init())
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	/// Ввод номера телефона при регистрации.
	func makeRegistrationEnteryPhone(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			text: nil,
			title: "Phone",
			placeholder: "Enter your phone number",
			onBack: Command {
				self.makeRegistrationOptions(request: .init())
			},
			onNext: Command { enteredPassword in
				self.makeRegistrationEnteryPhoneCode(request: .init())
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
	
	/// Ввод кода из смс при регистрации.
	func makeRegistrationEnteryPhoneCode(request: LoginModel.Request) {
		let response = LoginModel.Response.EntryCredentials(
			text: nil,
			title: "Code",
			placeholder: "Enter the code from the sms",
			onBack: Command {
				self.makeRegistrationEnteryPhone(request: .init())
			},
			onNext: Command { enteredPassword in
				print("Finish entry code")
			}
		)
		self.presenter?.buildEnteryCredentials(response: response)
	}
}
