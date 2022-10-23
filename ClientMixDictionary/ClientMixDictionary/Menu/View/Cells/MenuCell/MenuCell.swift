//
//  MenuCellTableViewCell.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.10.2022.
//

import UIKit
import CoreTableView
import CoreExtensions

protocol _MenuCell: CellData {
	var title: String? { get }
	var image: UIImage? { get }
}
extension _MenuCell {
	public var height: CGFloat { return 60 }
	
	public func hashValues() -> [Int] {
		return [
			title.hashValue
		]
	}
	
	public var backgroundColor: UIColor? { return nil }
	
	public func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
		guard let cell = cell as? MenuCell else { return }
		cell.configure(with: self)
	}
	
	public func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		tableView.register(MenuCell.nib(), forCellReuseIdentifier: MenuCell.identifire)
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifire, for: indexPath) as? MenuCell
		else { return .init() }
		return cell
	}
}


final class MenuCell: UITableViewCell {

	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var leftImage: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	
	func configure(with data: _MenuCell) {
		self.title.text = data.title
		self.leftImage.image = data.image
	}
    
}
