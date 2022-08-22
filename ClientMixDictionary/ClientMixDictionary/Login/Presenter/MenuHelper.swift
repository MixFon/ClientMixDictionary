//
//  MenuHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 16.08.2022.
//

import CoreTableView
import UIKit

class MenuHelper: _TableHelper {
	
	var actions: LoginModel.Response.Menu?
	
	func makeState() -> State {
		let elements = makeElements()
		let section = makeSection()
		let state = State(model: section, elements: elements)
		return state
	}
	
	func makeHeader() -> HeaderData? {
		let header = LoginView.ViewState.MenuHeader(
			id: "menuHeader",
			title: "Log in to the app",
			style: .large,
			backgroundColor: .clear,
			isInsetGrouped: true
		)
		return header
	}
	
	func makeFooter() -> FooterData? {
		return nil
	}
	
	func makeElements() -> [Element] {
		guard
			let choseLogin = self.actions?.onLogin,
			let choseRegistration = self.actions?.onRegistration
		else {
			return []
		}
		let login = LoginView.ViewState.MenuCell(
			id: "loginElem",
			image: UIImage(systemName: "person.crop.circle"),
			title: "Login",
			onItemSelect: choseLogin
		)
		let registration = LoginView.ViewState.MenuCell(
			id: "registrationElem",
			image: UIImage(systemName: "person.crop.circle.badge.plus"),
			title: "Registration",
			onItemSelect: choseRegistration
		)
		return [login.toElement(), registration.toElement()]
	}
	
	func makeSection() -> SectionState {
		let section = SectionState(
			id: "menuSection",
			isCollapsed: false,
			header: makeHeader(),
			footer: makeFooter()
		)
		return section
	}
	
	
}
