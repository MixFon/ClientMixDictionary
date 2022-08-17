//
//  MenuHeader.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 16.08.2022.
//

import UIKit
import CoreExtensions
import CoreTableView

protocol _MenuHeader: HeaderData {
	var title: String? { get }
}

extension _MenuHeader {
	
	public func hashValues() -> [Int] {
		return [
			title.hashValue
		]
	}
	
	public var height: CGFloat {
		return 100
	}
	
	public func header(for tableView: UITableView, section: Int) -> UIView? {
		tableView.register(MenuHeader.self, forHeaderFooterViewReuseIdentifier: MenuHeader.identifire)
		guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MenuHeader.identifire) as? MenuHeader else { return nil }
		headerView.configure(data: self)
		return headerView
	}
}

class MenuHeader: UITableViewHeaderFooterView {
	let title = UILabel()
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		configureContents()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureContents() {
		title.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(title)
		
		// Center the image vertically and place it near the leading
		// edge of the view. Constrain its width and height to 50 points.
		NSLayoutConstraint.activate([
//			title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//			title.widthAnchor.constraint(equalToConstant: 50),
//			title.heightAnchor.constraint(equalToConstant: 50),
//			title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			
			// Center the label vertically, and use it to fill the remaining
			// space in the header view.
			title.heightAnchor.constraint(equalToConstant: 30),
			title.leadingAnchor.constraint(equalTo: contentView.trailingAnchor),
			title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
			title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
	
	func configure(data: _MenuHeader) {
		self.title.text = data.title
	}
	
	
}
