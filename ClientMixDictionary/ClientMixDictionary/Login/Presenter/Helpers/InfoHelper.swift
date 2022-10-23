//
//  InfoHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.08.2022.
//

import CoreTableView
import UIKit

final class InfoHelper: _TableHelper {
	var text: String?
	var font: UIFont?
	var infoImage: UIImage?
	var imageColor: UIColor?
	var onSelect: Command<Void>?
	
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
		guard let onSelect = onSelect else {
			return []
		}
		let image = LoginView.ViewState.InfoImageCell(
			id: "imageElem",
			infoImage: self.infoImage,
			imageCollor: self.imageColor
		)
		let text = self.text ?? ""
		let font = self.font ?? UIFont.systemFont(ofSize: 17)
		let message = LoginView.ViewState.LableCell(
			id: "lableElem",
			text: text,
			font: font,
			height: LoginView.ViewState.LableCell.calculateHeigth(text: text, font: font),
			onItemSelect: onSelect
		)
		return [image.toElement(), message.toElement()]
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
