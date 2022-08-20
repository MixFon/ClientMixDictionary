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
		
		enum Login {
			
			struct EntryEmail {
				var onBack: Command<Void>?
				var onNext: Command<String>?
			}
			
			struct EntryPassword {
				var onBack: Command<Void>?
				var onNext: Command<String>?
			}
			
			struct EntryPhone {
				var onBack: Command<Void>?
				var onNext: Command<String>?
			}
			
			struct EntryPhoneCode {
				var onBack: Command<Void>?
				var onNext: Command<String>?
			}
		}
		
	}
	
	struct ViewModel {
		var states: [State]
	}
	
}
