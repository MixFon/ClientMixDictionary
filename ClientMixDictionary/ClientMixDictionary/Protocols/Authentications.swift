//
//  Authentications.swift
//  ClientMixDictionary
//
//  Created by Михаил Фокин on 28.08.2022.
//

import Foundation

protocol _Authentications {
   func signIn(withEmail: String, password: String, completion: @escaping (Result<Credentials,Error>) -> Void)
   func signUp(withEmail: String, password: String, completion: @escaping (Result<Credentials,Error>) -> Void)
}
