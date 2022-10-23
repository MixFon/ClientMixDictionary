//
//  Router.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 23.10.2022.
//

import UIKit
import Foundation

protocol _MenuRouter {
	func presentLernWords()
	func presentSaveWords()
	func presentSettings()
}

final class MenuRouter: _MenuRouter {
	
	weak var controller: UIViewController?
	
	init(controller: UIViewController?) {
		self.controller = controller
	}
	
	func presentLernWords() {
		return
	}
	
	func presentSaveWords() {
		return
	}

	
	func presentSettings() {
		return
	}
	
}
