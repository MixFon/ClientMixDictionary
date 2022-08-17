//
//  LoginInteractor.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import CoreTableView

protocol _LoginInteractor {
	func makeLogin(request: LoginModel.Request)
	func makeMenu(request: LoginModel.Request)
	func makeChoseLogin(request: LoginModel.Request)
}

protocol _LoginDataStore {
	
}

final class LoginInteractor: _LoginInteractor, _LoginDataStore {
	
	private var presenter: _LoginPresenter?
	
	init(presenter: _LoginPresenter?) {
		self.presenter = presenter
	}
	
	func makeLogin(request: LoginModel.Request) {
	}
	
	func makeMenu(request: LoginModel.Request) {
		let response = LoginModel.Response.Menu(
			chosenLogin: Command {
				print("Menu")
				self.makeChoseLogin(request: .init())
			},
			chosenRegistration: Command {
				print("REG")
			}
		)
		self.presenter?.makeMenu(response: response)
	}
	
	func makeChoseLogin(request: LoginModel.Request) {
		let response = LoginModel.Response.ChoseLogin(
			chosenEmale: Command {
				print("Emale")
			},
			chosenPhone: Command {
				print("Phone")
			}
		)
		self.presenter?.makeChoseLogin(response: response)
	}
	
}
