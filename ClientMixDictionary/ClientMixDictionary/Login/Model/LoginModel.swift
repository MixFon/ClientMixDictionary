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
		
		struct Menu {
			var onLogin: Command<Void>?
			var onRegistration: Command<Void>?
		}
		
		struct ChoseLogin {
			var onBack: Command<Void>?
			var onEmail: Command<Void>?
			var onPhone: Command<Void>?
		}
		
		struct ChoseRegistration {
			var onBack: Command<Void>?
			var onEmail: Command<Void>?
			var onPhone: Command<Void>?
		}
		
		struct EntryCredentials {
			var text: String?
			var title: String?
			var placeholder: String?
			var onBack: Command<Void>?
			var onNext: Command<String>?
		}
		
	}
	
	struct ViewModel {
		var states: [State]
	}
	
}
