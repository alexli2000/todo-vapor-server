//
//  UserController.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-02.
//

import Crypto
import Vapor
import FluentSQLite

// MARK: Content
/// Data required to create a user.
struct CreateUserRequest: Content {
	/// User's full name.
	var username: String

	/// User's email address.
	var email: String

	/// User's desired password.
	var password: String

	/// User's password repeated to ensure they typed it correctly.
	var verifyPassword: String
}

/// Public representation of user data.
struct UserResponse: Content {
	/// User's unique identifier.
	/// Not optional since we only return users that exist in the DB.
	var id: UUID

	/// User's full name.
	var username: String

	/// User's email address.
	var email: String
}

/// Creates new users and logs them in.
final class UserController {
	/// Logs a user in, returning a token for accessing protected endpoints.
	func login(_ req: Request) throws -> Future<UserToken> {
		// get user auth'd by basic auth middleware
		let user = try req.requireAuthenticated(User.self)

		// create new token for this user
		let token = try UserToken.create(userID: user.requireID())

		// save and return token
		return token.save(on: req)
	}

	/// Creates a new user.
	func create(_ req: Request) throws -> Future<UserResponse> {
		return try req.content.decode(CreateUserRequest.self).flatMap { user -> Future<User> in
			guard user.password == user.verifyPassword else {
				throw Abort(.badRequest, reason: "Password and verification must match.")
			}

			let hash = try BCrypt.hash(user.password)
			return User(id: nil, username: user.username, email: user.email, passwordHash: hash)
				.save(on: req)
			}.map { user in
				return try UserResponse(id: user.requireID(), username: user.username, email: user.email)
		}
	}
}
