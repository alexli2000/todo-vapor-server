//
//  TaskController.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-03.
//

import Fluent
import Vapor

/// Controls basic CRUD operations on `Task`s.
final class TaskController {
	/// Returns a list of all `Task`s.
	func index(_ req: Request) throws -> Future<[Task]> {
		let user = try req.requireAuthenticated(User.self)

		return try Task.query(on: req).filter(\.creatorID == user.requireID()).all()
	}

	/// Saves a decoded `Task` to the database.
	func create(_ req: Request) throws -> Future<Task> {
		let user = try req.requireAuthenticated(User.self)

		return try req.content.decode(TaskCreationRequest.self).flatMap { task in
			return try Task(title: task.title, createdOn: Date(), creatorID: user.requireID(), dueDate: nil).save(on: req)
		}
	}
}

struct TaskCreationRequest: Content {

	var title: String
}
