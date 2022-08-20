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
	func makeLoginEnterPhone(request: LoginModel.Request)
	func makeLoginEnterPhoneCode(request: LoginModel.Request)
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
	
	/// Создает действия для стартового меню.
	func makeMenu(request: LoginModel.Request) {
		let response = LoginModel.Response.Menu(
			onLogin: Command {
				print("Menu")
				self.makeLoginOptions(request: .init())
			},
			onRegistration: Command {
				print("REG")
			}
		)
		self.presenter?.buildMenu(response: response)
	}
	
	/// Создает действия для состояния выбора способа входа в систему.
	func makeLoginOptions(request: LoginModel.Request) {
		let response = LoginModel.Response.ChoseLogin(
			onBack: Command {
				self.makeMenu(request: .init())
			},
			onEmail: Command {
				self.makeLoginEnteryEmail(request: .init())
			},
			onPhone: Command {
				self.makeLoginEnterPhone(request: .init())
			}
		)
		self.presenter?.buildChoseLogin(response: response)
	}
	
	/// Создание действий для ввода email при входе в систему.
	func makeLoginEnteryEmail(request: LoginModel.Request) {
		let response = LoginModel.Response.Login.EntryEmail(
			onBack: Command {
				self.makeLoginOptions(request: .init())
			},
			onNext: Command { enteredEmail in
				self.makeLoginEnteryPassword(request: .init())
			}
		)
		self.presenter?.buildLoginEnteryEmail(response: response)
	}
	
	/// Создание действий для ввода пароля при входе в систему.
	func makeLoginEnteryPassword(request: LoginModel.Request) {
		let response = LoginModel.Response.Login.EntryPassword(
			onBack: Command {
				self.makeLoginEnteryEmail(request: .init())
			},
			onNext: Command { enteredPassword in
				print("Finish login")
			}
		)
		self.presenter?.buildLoginEnteryPassword(response: response)
	}
	
	/// Создание действий для ввода номера телефона при входе в систему.
	func makeLoginEnterPhone(request: LoginModel.Request) {
		let response = LoginModel.Response.Login.EntryPhone(
			onBack: Command {
				self.makeLoginOptions(request: .init())
			},
			onNext: Command { enteredPassword in
				self.makeLoginEnterPhoneCode(request: .init())
			}
		)
		self.presenter?.buildLoginEnteryPhone(response: response)
	}
	
	/// Создание действий для ввода кода из смс при входе в систему.
	func makeLoginEnterPhoneCode(request: LoginModel.Request) {
		let response = LoginModel.Response.Login.EntryPhoneCode(
			onBack: Command {
				self.makeLoginEnterPhone(request: .init())
			},
			onNext: Command { enteredPassword in
				print("Finish entry code")
			}
		)
		self.presenter?.buildLoginEnteryPhoneCode(response: response)
	}
}
