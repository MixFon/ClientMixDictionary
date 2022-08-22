//
//  InfoLableCell.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.08.2022.
//

import UIKit
import CoreExtensions
import CoreTableView

protocol _InfoLableCell: CellData {
	var text: String { get }
	var font: UIFont { get }
}

extension _InfoLableCell {
	public func hashValues() -> [Int] {
		return [
			text.hashValue,
			font.hashValue
		]
	}
	
	public var backgroundColor: UIColor? { return nil }
	
	public func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
		guard let cell = cell as? InfoLableCell else { return }
		cell.configure(data: self)
	}
	
	public func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		tableView.register(InfoLableCell.nib(), forCellReuseIdentifier: InfoLableCell.identifire)
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: InfoLableCell.identifire, for: indexPath) as? InfoLableCell
		else { return .init() }
		return cell
	}
	
	static func calculateHeigth(text: String, font: UIFont) -> CGFloat {
		let lbl = UILabel()
		lbl.numberOfLines = 0
		lbl.font = font // make sure you set this correctly
		lbl.text = text
		
		let margin = 16.0
		
		let width = UIScreen.main.bounds.width - margin - margin
		
		let height = lbl.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
		return height + margin + margin
	}
}

class InfoLableCell: UITableViewCell {

	@IBOutlet private weak var title: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configure(data: _InfoLableCell) {
		title.text = data.text
		title.font = data.font
	}
    
}
