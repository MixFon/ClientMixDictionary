//
//  ImageCell.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 16.08.2022.
//

import UIKit
import CoreExtensions
import CoreTableView

protocol _ImageCell: CellData {
	var image: UIImage? { get }
	var title: String? { get }
}

extension _ImageCell {
	
	public var height: CGFloat { return 52 }
	
	public func hashValues() -> [Int] {
		return [
			
		]
	}
	
	public var backgroundColor: UIColor? { return nil }
	
	public func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
		guard let cell = cell as? ImageCell else { return }
		cell.configure(data: self)
	}
	
	public func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		tableView.register(ImageCell.nib(), forCellReuseIdentifier: ImageCell.identifire)
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifire, for: indexPath) as? ImageCell
		else { return .init() }
		return cell
	}
}


class ImageCell: UITableViewCell {
	@IBOutlet private weak var leftImage: UIImageView!
	@IBOutlet private weak var title: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configure(data: _ImageCell) {
		self.leftImage.image = data.image
		self.title.text = data.title
	}
    
}
