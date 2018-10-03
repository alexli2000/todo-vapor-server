//
//  ActivityItem+Fluent.swift
//  App
//
//  Created by Kristina Quicho on 2018-10-02.
//

import FluentSQLite
import Vapor

/// Alows it to be used as a SQLLite model with a UUID.
extension ActivityItem: SQLiteUUIDModel { }

/// Allows it to be used as a dynamic migration.
extension ActivityItem: Migration { }

/// Allows it to be encoded to and decoded from HTTP messages.
extension ActivityItem: Content { }

/// Allows it to be used as a dynamic parameter in route definitions.
extension ActivityItem: Parameter { }
