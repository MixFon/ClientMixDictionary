//
//  ChoseLoginHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 17.08.2022.
//

import UIKit
import CoreTableView

class ChoseLoginHelper: _TableHelper {
	
	var actions: LoginModel.Response.ChoseLogin?
	
	func makeState() -> State {
		let elements = makeElements()
		let section = makeSection()
		let state = State(model: section, elements: elements)
		return state
	}
	
	func makeHeader() -> HeaderData? {
		let header = LoginView.ViewState.MenuHeader(
			id: "choseHeader",
			title: "Login options",
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
			let chosenEmale = self.actions?.chosenEmale,
			let chosenPhone = self.actions?.chosenPhone
		else { return [] }
		let login = LoginView.ViewState.MenuCell(
			id: "emailElem",
			image: UIImage(systemName: "mail"),
			title: "Emale",
			onItemSelect: chosenEmale
		)
		let registration = LoginView.ViewState.MenuCell(
			id: "phoneElem",
			image: UIImage(systemName: "phone"),
			title: "Registration",
			onItemSelect: chosenPhone
		)
		return[login.toElement(), registration.toElement()]
	}
	
	func makeSection() -> SectionState {
		let section = SectionState(
			id: "choseSection",
			isCollapsed: false,
			header: makeHeader(),
			footer: makeFooter()
		)
		return section
	}
	
}
		
