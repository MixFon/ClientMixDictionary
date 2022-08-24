//
//  FieldHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import CoreTableView
import CoreExtensions
import UIKit

class FieldHelper: _TableHelper {
	
	var actions: LoginModel.Response.EntryCredentials?
	
	public func makeState() -> State {
		let elements = makeElements()
		let section = makeSection()
		let state = State(model: section, elements: elements)
		return state
	}
	
	func makeHeader() -> HeaderData? {
		return nil
	}
	
	func makeFooter() -> FooterData? {
		return nil
	}
	
	func makeElements() -> [Element] {
		let model = LoginView.ViewState.FieldCell(
			id: "fildElement",
			title: self.actions?.title,
			placeholger: self.actions?.placeholder,
			onNext: self.actions?.onNext,
			onBack: self.actions?.onBack
		)
		return [model.toElement()]
	}
	
	func makeSection() -> SectionState {
		let section = SectionState(
			id: "loginSection",
			isCollapsed: false,
			header: makeHeader(),
			footer: makeFooter()
		)
		return section
	}
}
