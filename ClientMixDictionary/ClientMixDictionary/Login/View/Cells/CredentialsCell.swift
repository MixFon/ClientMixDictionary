//
//  CredentialsField.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import UIKit
import CoreTableView
import CoreExtensions

protocol _CredentialsCell: CellData {
	var title: String? { get set }
	var placeholger: String? { get set }
	var onNext: Command<String>? { get set }
	var onBack: Command<Void>? { get set }
}

extension _CredentialsCell {
	
	public var height: CGFloat { return 150 }
	
	public func hashValues() -> [Int] {
		return [
			title.hashValue,
			placeholger.hashValue
		]
	}
	
	public var backgroundColor: UIColor? { return nil }
	
	public func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
		guard let cell = cell as? CredentialsCell else { return }
		cell.configure(data: self)
	}
	
	public func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		tableView.register(CredentialsCell.nib(), forCellReuseIdentifier: CredentialsCell.identifire)
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: CredentialsCell.identifire, for: indexPath) as? CredentialsCell
		else { return .init() }
		return cell
	}
}

class CredentialsCell: UITableViewCell {
	@IBOutlet private weak var title: UILabel!
	@IBOutlet private weak var field: UITextField!
	
	@IBOutlet private weak var buttonNext: UIButton!
	@IBOutlet private weak var buttonBack: UIButton!
	
	var onNext: Command<String>?
	var onBack: Command<Void>?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	@IBAction func pressNext(_ sender: UIButton) {
		guard let text = self.field.text else { return }
		onNext?.perform(with: text)
	}
	
	@IBAction func pressBack(_ sender: UIButton) {
		self.onBack?.perform(with: ())
	}
	
	func configure(data: _CredentialsCell) {
		self.title.text = data.title
		self.field.placeholder = data.placeholger
		self.onNext = data.onNext
		self.onBack = data.onBack
	}
    
}
