//
//  Task.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

struct Task: Codable, Hashable {

	var id: UUID?
	var title: String
	var createdOn: Date
	var creator: User
	var dueDate: Date?
	var progressStatus: TaskProgressStatus
	var subtasks: [Subtask]

	var comments: [Comment]

	init(id: UUID? = nil,
		 title: String,
		 createdOn: Date,
		 creator: User,
		 dueDate: Date?,
		 progressStatus: TaskProgressStatus = .toDo,
		 subtasks: [Subtask] = [],
		 comments: [Comment] = [])
	{
		self.id = id
		self.title = title
		self.createdOn = createdOn
		self.creator = creator
		self.dueDate = dueDate
		self.progressStatus = progressStatus
		self.subtasks = subtasks
		self.comments = comments
	}
}

extension Task {

	var progress: Double {
		guard !subtasks.isEmpty else {
			return 0
		}

		return Double(subtasks.filter { $0.isComplete }.count) / Double(subtasks.count)
	}

	var isComplete: Bool {
		return subtasks.allSatisfy { $0.isComplete }
	}
}
