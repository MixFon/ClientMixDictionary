//
//  LoginController.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation
import UIKit

protocol _LoginController {
	func showData(viewModel: LoginModel.ViewModel)
}

class LoginController: UIViewController {
	
	private let nestedView = LoginView(frame: UIScreen.main.bounds)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view = nestedView
	}
}

extension LoginController: _LoginController {
	
	func showData(viewModel: LoginModel.ViewModel) {
		self.nestedView.configute(states: viewModel.states)
	}
	
	
}
