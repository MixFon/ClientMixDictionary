//
//  AuthWorker.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 28.08.2022.
//

import Foundation
import FirebaseAuth

final class AuthFirebaseAdapter: _Authentications {
	
	func signIn(withEmail: String, password: String, completion: @escaping (Result<Credentials, Error>) -> Void) {
		Auth.auth().signIn(withEmail: withEmail, password: password) { authResult, errorResult in
			if let error = errorResult {
				completion(.failure(error))
			} else {
				completion(.success(.init()))
			}
		}
	}
	
	func signUp(withEmail: String, password: String, completion: @escaping (Result<Credentials, Error>) -> Void) {
		Auth.auth().createUser(withEmail: withEmail, password: password) { authResult, errorResult in
			if let error = errorResult {
				completion(.failure(error))
			} else {
				completion(.success(.init()))
			}
		}
	}
	
	
}
