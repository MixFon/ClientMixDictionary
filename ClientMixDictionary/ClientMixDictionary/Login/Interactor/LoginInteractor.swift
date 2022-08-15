//
//  LoginInteractor.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation

protocol _LoginInteractor {
	func makeLogin(request: LoginModel.Request)
}

protocol _LoginDataStore {
	
}

final class LoginInteractor: _LoginInteractor, _LoginDataStore {
	
	private var presenter: _LoginPresenter?
	
	init(presenter: _LoginPresenter?) {
		self.presenter = presenter
	}
	
	func makeLogin(request: LoginModel.Request) {
		let response = LoginModel.Response()
		self.presenter?.makeLogin(response: response)
	}
	
	
}
