//
//  ChoseLoginHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 17.08.2022.
//

import UIKit
import CoreTableView

class OptionsLoginHelper: _TableHelper {
	
	var onEmail: Command<Void>?
	var onPhone: Command<Void>?
	var onBack: Command<Void>?
	
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
			let onEmail = self.onEmail,
			let onPhone = self.onPhone,
			let onBack = self.onBack
		else {
			return []
		}
		let login = LoginView.ViewState.MenuCell(
			id: "emailElem",
			image: UIImage(systemName: "at"),
			title: "Email",
			onItemSelect: onEmail
		)
		let registration = LoginView.ViewState.MenuCell(
			id: "phoneElem",
			image: UIImage(systemName: "phone"),
			title: "Phone",
			onItemSelect: onPhone
		)
		let back = LoginView.ViewState.MenuCell(
			id: "backElem",
			image: UIImage(systemName: "chevron.backward.circle"),
			title: "Back",
			onItemSelect: onBack
		)
		let elements = [login, registration, back].map( { $0.toElement() } )
		return elements
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
		
