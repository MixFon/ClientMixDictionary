//
//  LoginView.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import CoreTableView
import UIKit

class LoginView: UIView {
	
	private var table: BaseTableView!
	
	struct ViewState {
		
		struct FieldCell: _CredentialsCell {
			var id: String
			var title: String?
			var placeholger: String?
			var onNext: Command<String>?
			var onBack: Command<Void>?
		}
		
		struct MenuCell: _ImageCell {
			var id: String
			var image: UIImage?
			var title: String?
			var onItemSelect: Command<Void>
		}
		
		struct MenuHeader: _TitleHeaderView {
			var id: String
			var title: String
			var style: TitleHeaderView.Style
			var backgroundColor: UIColor
			var isInsetGrouped: Bool
		}
		
		struct InfoImageCell: _InfoImageCell {
			var id: String
			var infoImage: UIImage?
			var imageCollor: UIColor?
		}
		
		struct LableCell: _InfoLableCell {
			var id: String
			var text: String
			var font: UIFont
			var height: CGFloat
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
	
	
	func configute(states: [State]) {
		self.table.viewStateInput = states
	}
	
	private func setupTableView() {
		table = BaseTableView(frame: .zero, style: .insetGrouped)
		table.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(table)
		backgroundColor = .systemBackground
		NSLayoutConstraint.activate([
			table.topAnchor.constraint(equalTo: topAnchor),
			table.leadingAnchor.constraint(equalTo: leadingAnchor),
			table.trailingAnchor.constraint(equalTo: trailingAnchor),
			table.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
