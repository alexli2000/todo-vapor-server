//
//  TaskController.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-03.
//

import Vapor

/// Controls basic CRUD operations on `Task`s.
final class TaskController {
	/// Returns a list of all `Todo`s.
	func index(_ req: Request) throws -> Future<[Task]> {
		return Task.query(on: req).all()
	}

	/// Saves a decoded `Todo` to the database.
	func create(_ req: Request) throws -> Future<Task> {
		return try req.content.decode(Task.self).flatMap { task in
			return task.save(on: req)
		}
	}
}
