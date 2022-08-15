//
//  TableHelper.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import CoreTableView

public protocol _TableHelper {
	func makeState() -> State
	func makeHeader() -> HeaderData?
	func makeFooter() -> FooterData?
	func makeElements() -> [Element]
	func makeSection() -> SectionState
}
