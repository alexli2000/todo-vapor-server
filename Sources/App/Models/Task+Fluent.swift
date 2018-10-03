//
//  Task+Fluent.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-02.
//

import FluentSQLite
import Vapor

/// Alows it to be used as a SQLLite model with a UUID.
extension Task: SQLiteUUIDModel { }

/// Allows it to be used as a dynamic migration.
extension Task: Migration { }

/// Allows it to be encoded to and decoded from HTTP messages.
extension Task: Content { }

/// Allows it to be used as a dynamic parameter in route definitions.
extension Task: Parameter { }

extension Task {

	// The creator of this task
	var creator: Parent<Task, User> {
		return parent(\.creatorID)
	}

	var project: Parent<Task, Project> {
		return parent(\.projectID)
	}

	// The subtasks belonging to this task
	var subtasks: Children<Task, Subtask> {
		return children(\.taskID)
	}
}
