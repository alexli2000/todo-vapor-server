//
//  User+Fluent.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-02.
//

import FluentSQLite
import Vapor
import Authentication

/// Alows it to be used as a SQLLite model with a UUID.
extension User: SQLiteUUIDModel { }

/// Allows it to be used as a dynamic migration.
extension User: Migration { }

/// Allows it to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows it to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

//extension User: TokenAuthenticatable {
//	/// See `TokenAuthenticatable`.
//	typealias TokenType = UserToken
//}

/// Allows users to be verified by basic / password auth middleware.
//extension User: PasswordAuthenticatable {
//	/// See `PasswordAuthenticatable`.
//	static var usernameKey: WritableKeyPath<User, String> {
//		return \.email
//	}
//
//	/// See `PasswordAuthenticatable`.
//	static var passwordKey: WritableKeyPath<User, String> {
//		return \.passwordHash
//	}
//}

extension User {

	var tasksCreated: Children<User, Task> {
		return children(\.creatorID)
	}
}
