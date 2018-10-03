//
//  Project+Fluent.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-02.
//

import FluentSQLite
import Vapor

/// Alows it to be used as a SQLLite model with a UUID.
extension Project: SQLiteUUIDModel { }

/// Allows it to be used as a dynamic migration.
extension Project: Migration { }

/// Allows it to be encoded to and decoded from HTTP messages.
extension Project: Content { }

/// Allows it to be used as a dynamic parameter in route definitions.
extension Project: Parameter { }

extension Project {

	// The tasks in this project
	var tasks: Children<Project, Task> {
		return children(\.projectID)
	}
}
