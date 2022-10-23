//
//  MenuController.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.10.2022.
//

import UIKit

protocol _MenuController: AnyObject {
	func showStates(show: MenuModel.ViewModel.Show)
	func makeMenu()
	
	func presentLernWords()
	func presentSaveWords()
	func presentSettings()
}

final class MenuController: UIViewController {
	
	private var menuView = MenuView(frame: UIScreen.main.bounds)
	private var router: _MenuRouter?
	
	var interactor: _MenuInteractor?
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view = menuView
		makeMenu()
    }
	
	func setup() {
		let controller = self
		let presenter = MenuPresenter(controller: controller)
		let interactor = MenuInteractor(presenter: presenter)
		self.interactor = interactor
		
		let router = MenuRouter(controller: controller)
		controller.router = router
	}

}

extension MenuController: _MenuController {

	func makeMenu() {
		self.interactor?.makeMenu()
	}
	
	func showStates(show: MenuModel.ViewModel.Show) {
		self.menuView.configuration(with: show)
	}
	
	func presentLernWords() {
		self.router?.presentLernWords()
	}
	
	func presentSaveWords() {
		self.router?.presentSaveWords()
	}
	
	func presentSettings() {
		self.router?.presentSettings()
	}
}
