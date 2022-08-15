//
//  LoginPresenter.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import CoreTableView

protocol _LoginPresenter {
	func makeLogin(response: LoginModel.Response)
}

final class LoginPresenter: _LoginPresenter {
	
	weak var controller: _LoginController?
	
	init(controller: _LoginController?) {
		self.controller = controller
	}
	
	func makeLogin(response: LoginModel.Response) {
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
	
}
