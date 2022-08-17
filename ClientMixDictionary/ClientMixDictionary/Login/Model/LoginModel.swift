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
			var chosenLogin: Command<Void>?
			var chosenRegistration: Command<Void>?
		}
		
		struct ChoseLogin {
			var chosenEmale: Command<Void>?
			var chosenPhone: Command<Void>?
		}
		
	}
	
	struct ViewModel {
		var states: [State]
	}
	
}
