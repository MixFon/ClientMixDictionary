//
//  LoginRouter.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import Foundation

protocol _LoginRouter {
	func presentController()
}

protocol _LoginDataPassing {
	var data: _LoginDataStore? { get }
}

final class LoginRouter: _LoginRouter, _LoginDataPassing {
	var data: _LoginDataStore?
	
	private var controller: LoginController?
	
	init(controller: LoginController?) {
		self.controller = controller
	}
	
	func presentController() {
		
	}
	
	
}
