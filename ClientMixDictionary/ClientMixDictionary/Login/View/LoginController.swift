//
//  LoginController.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import UIKit

protocol _LoginController: AnyObject {
	func showState(viewModel: LoginModel.ViewModel.Show)
	func checkLoginState(viewModel: LoginModel.ViewModel.Check.Login)
	func checkRegistrationState(viewModel: LoginModel.ViewModel.Check.Registration)
}

class LoginController: UIViewController {
	
	private let nestedView = LoginView(frame: UIScreen.main.bounds)
	
	private var interactor: _LoginInteractor?
	
	private var router: (_LoginRouter & _LoginDataPassing)?
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view = nestedView
		self.interactor?.makeMenu()
		
	}
	
	private func setup() {
		let controller = self
		let presenter = LoginPresenter(controller: controller)
		let interactor = LoginInteractor(presenter: presenter)
		self.interactor = interactor
		
		let router = LoginRouter(controller: controller)
		controller.router = router
		
		router.data = interactor
	}
}

extension LoginController: _LoginController {
	
	func checkRegistrationState(viewModel: LoginModel.ViewModel.Check.Registration) {
		switch viewModel {
		case .login(let email):
			self.interactor?.checkLoginEnteredEmail(email: email)
		case .password(let password):
			self.interactor?.checkRegistrationEnteredPassword(password: password)
		case .confirm(let confirm):
			self.interactor?.checkRegistrationEnteredConfirm(confirm: confirm)
		case .code(let code):
			self.interactor?.checkRegistrationEnteredCode(code: code)
		case .phone(let phone):
			self.interactor?.checkRegistrationEnteredPhone(phone: phone)
		}
	}
	
	func checkLoginState(viewModel: LoginModel.ViewModel.Check.Login) {
		switch viewModel{
		case .login(let email):
			self.interactor?.checkLoginEnteredEmail(email: email)
		case .password(let password):
			self.interactor?.checkLoginEnteredPassword(password: password)
		case .code(let code):
			self.interactor?.checkLoginEnteredCode(code: code)
		case .phone(let phone):
			self.interactor?.checkLoginEnteredPhone(phone: phone)
		}
	}
	
	func showState(viewModel: LoginModel.ViewModel.Show) {
		self.nestedView.configute(states: viewModel.states)
	}
	
}
