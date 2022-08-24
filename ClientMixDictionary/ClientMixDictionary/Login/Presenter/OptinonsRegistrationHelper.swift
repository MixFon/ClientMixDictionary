//
//  OptinonsRegistrationHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 24.08.2022.
//

import Foundation
import CoreTableView
import UIKit

class OptionsRegistrationHelper: _TableHelper {
	
	var actions: LoginModel.Response.ChoseLogin?
	
	func makeState() -> State {
		let elements = makeElements()
		let section = makeSection()
		let state = State(model: section, elements: elements)
		return state
	}
	
	func makeHeader() -> HeaderData? {
		let header = LoginView.ViewState.MenuHeader(
			id: "choseHeaderReg",
			title: "Registration options",
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
			let onEmail = self.actions?.onEmail,
			let onPhone = self.actions?.onPhone,
			let onBack = self.actions?.onBack
		else {
			return []
		}
		let login = LoginView.ViewState.MenuCell(
			id: "emailElemReg",
			image: UIImage(systemName: "at.badge.plus"),
			title: "Email",
			onItemSelect: onEmail
		)
		let registration = LoginView.ViewState.MenuCell(
			id: "phoneElemReg",
			image: UIImage(systemName: "phone.badge.plus"),
			title: "Phone",
			onItemSelect: onPhone
		)
		let back = LoginView.ViewState.MenuCell(
			id: "backElemReg",
			image: UIImage(systemName: "chevron.backward.circle"),
			title: "Back",
			onItemSelect: onBack
		)
		let elements = [login, registration, back].map( { $0.toElement() } )
		return elements
	}
	
	func makeSection() -> SectionState {
		let section = SectionState(
			id: "choseSectionReg",
			isCollapsed: false,
			header: makeHeader(),
			footer: makeFooter()
		)
		return section
	}
	
}
		
