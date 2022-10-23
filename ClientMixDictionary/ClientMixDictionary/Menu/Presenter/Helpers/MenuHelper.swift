//
//  MenuHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.10.2022.
//

import CoreTableView

struct MenuHelper: _TableHelper {
	
	func makeState() -> State {
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
		let learnWords = MenuView.ViewState.MenuCell(
			id: "menuLearnWords",
			title: "Learn words",
			image: .init(systemName: "hare"),
			onItemSelect: Command {
				debugPrint("Learn words")
			}
		)
		let saveWords = MenuView.ViewState.MenuCell(
			id: "menuSaveWords",
			title: "Save words",
			image: .init(systemName: "doc.badge.plus"),
			onItemSelect: Command {
				debugPrint("Save words")
			}
		)
		let settings = MenuView.ViewState.MenuCell(
			id: "menuSettings",
			title: "Settings",
			image: .init(systemName: "gearshape"),
			onItemSelect: Command {
				debugPrint("Settings")
			}
		)
		return [learnWords.toElement(), saveWords.toElement(), settings.toElement()]
	}
	
	func makeSection() -> SectionState {
		let section = SectionState(
			id: "MainMenuSection",
			isCollapsed: false,
			header: makeHeader(),
			footer: makeFooter()
		)
		return section
	}
}
