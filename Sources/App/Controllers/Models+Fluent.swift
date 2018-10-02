//
//  Models+Fluent.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-02.
//

import FluentSQLite
import Vapor

/// Alows it to be used as a SQLLite model with a UUID.
extension Subtask: SQLiteUUIDModel { }

/// Allows it to be used as a dynamic migration.
extension Subtask: Migration { }

/// Allows it to be encoded to and decoded from HTTP messages.
extension Subtask: Content { }

/// Allows it to be used as a dynamic parameter in route definitions.
extension Subtask: Parameter { }
