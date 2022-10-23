//
//  MenuView.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 22.10.2022.
//

import UIKit
import CoreTableView

final class MenuView: UIView {

	private var table: BaseTableView!
	
	private var lable: UILabel = {
		let lable = UILabel()
		lable.text = "Menu"
		lable.textColor = .link
		lable.font = UIFont.boldSystemFont(ofSize: 24)
		lable.backgroundColor = .secondarySystemBackground
		return lable
	}()
	
	struct ViewState {
		
		struct MenuCell: _MenuCell {
			var id: String
			var title: String?
			var image: UIImage?
			var onItemSelect: Command<Void>
		}
		
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupTableView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupTableView()
	}
	
	
	func configuration(with data: MenuModel.ViewModel.Show) {
		self.table.viewStateInput = data.states
	}

	private func setupTableView() {
		self.table = BaseTableView(frame: .zero, style: .insetGrouped)
		self.table.translatesAutoresizingMaskIntoConstraints = false
		self.lable.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.table)
		self.addSubview(self.lable)
		self.backgroundColor = .secondarySystemBackground
		NSLayoutConstraint.activate([
			self.lable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			self.lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			self.lable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
			self.lable.heightAnchor.constraint(equalToConstant: 60),
			
			self.table.topAnchor.constraint(equalTo: self.lable.bottomAnchor),
			self.table.leadingAnchor.constraint(equalTo: leadingAnchor),
			self.table.trailingAnchor.constraint(equalTo: trailingAnchor),
			self.table.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
