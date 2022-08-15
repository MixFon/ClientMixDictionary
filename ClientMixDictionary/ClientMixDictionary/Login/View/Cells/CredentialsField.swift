//
//  CredentialsField.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import UIKit
import CoreTableView
import CoreExtensions

protocol _CredentialsField: CellData {
	var title: String? { get set }
	var placeholger: String? { get set }
	var onNext: Command<String>? { get set }
	var onBack: Command<Void>? { get set }
	
}

extension _CredentialsField {
	
	public var height: CGFloat { return 100 }
	
	public func hashValues() -> [Int] {
		return [
			title.hashValue,
			placeholger.hashValue
		]
	}
	
	public var backgroundColor: UIColor? { return nil }
	
	public func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
		guard let cell = cell as? CredentialsField else { return }
		cell.configure(data: self)
	}
	
	public func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		tableView.register(CredentialsField.nib(), forCellReuseIdentifier: CredentialsField.identifire)
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: CredentialsField.identifire, for: indexPath) as? CredentialsField
		else { return .init() }
		return cell
	}
}

class CredentialsField: UITableViewCell {
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var field: UITextField!
	
	var onNext: Command<String>?
	var onBack: Command<Void>?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBAction func pressNext(_ sender: UIButton) {
		
	}
	
	@IBAction func pressBack(_ sender: UIButton) {
		
	}
	
	func configure(data: _CredentialsField) {
		self.title.text = data.title
		self.field.placeholder = data.placeholger
	}
    
}
