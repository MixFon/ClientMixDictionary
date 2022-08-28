//
//  LoginModel.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 15.08.2022.
//

import CoreTableView

enum LoginModel {
	
	struct Request {
		
	}
	
	enum Response {
		
		struct EntryCredentials {
			var text: String?
			var title: String?
			var placeholder: String?
			var onBack: Command<Void>?
			var onNext: Command<String>?
		}
		
		struct Info {
			var message: String?
			var onClose: Command<Void>?
		}
		
	}
	
	struct ViewModel {
		struct Show {
			var states: [State]
		}
		
		enum Check {
			enum Login {
				case code(String)
				case phone(String)
				case login(String)
				case password(String)
			}
			
			enum Registration {
				case code(String)
				case phone(String)
				case login(String)
				case password(String)
				case confirm(String)
			}
		}
	}
	
}
