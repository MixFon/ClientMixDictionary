//
//  InfoCell.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 20.08.2022.
//

import UIKit
import CoreTableView
import CoreExtensions

/// Протокол с большой картинкой и текстом снизу.
protocol _InfoImageCell: CellData {
	var infoImage: UIImage? { get }
	var imageCollor: UIColor? { get }
}

extension _InfoImageCell {
	public var height: CGFloat { return 250 }
	
	public func hashValues() -> [Int] {
		return [
			infoImage.hashValue,
			imageCollor.hashValue
		]
	}
	
	public var backgroundColor: UIColor? { return nil }
	
	public func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
		guard let cell = cell as? InfoImageCell else { return }
		cell.configure(data: self)
	}
	
	public func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		tableView.register(InfoImageCell.nib(), forCellReuseIdentifier: InfoImageCell.identifire)
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: InfoImageCell.identifire, for: indexPath) as? InfoImageCell
		else { return .init() }
		return cell
	}
}


class InfoImageCell: UITableViewCell {

	@IBOutlet weak var infoImage: UIImageView!
	
	
	func configure(data: _InfoImageCell) {
		self.infoImage.image = data.infoImage
		self.infoImage.tintColor = data.imageCollor
	}
    
}
