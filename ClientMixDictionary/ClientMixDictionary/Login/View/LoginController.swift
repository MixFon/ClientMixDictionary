//
//  LoginController.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import UIKit

protocol _LoginController: AnyObject {
	func showState(viewModel: LoginModel.ViewModel)
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
		let request = LoginModel.Request()
		//self.interactor?.makeLogin(request: request)
		self.interactor?.makeMenu(request: request)
		
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
	
	func showState(viewModel: LoginModel.ViewModel) {
		self.nestedView.configute(states: viewModel.states)
	}
	
	
}
