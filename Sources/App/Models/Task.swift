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
	var creatorID: User.ID
	var dueDate: Date?
	var progressStatus: TaskProgressStatus.RawValue
	var subtaskIDs: [Subtask.ID]

	var commentIDs: [Comment.ID]

	init(id: ID? = nil,
		 title: String,
		 createdOn: Date,
		 creatorID: User.ID,
		 dueDate: Date?,
		 progressStatus: TaskProgressStatus = .toDo,
		 subtaskIDs: [Subtask.ID] = [],
		 commentIDs: [Comment.ID] = [])
	{
		self.id = id
		self.title = title
		self.createdOn = createdOn
		self.creatorID = creatorID
		self.dueDate = dueDate
		self.progressStatus = progressStatus.rawValue
		self.subtaskIDs = subtaskIDs
		self.commentIDs = commentIDs
	}
}

extension Task {

//	var progress: Double {
//		guard !subtaskIDs.isEmpty else {
//			return 0
//		}
//
//		return Double(subtaskIDs.filter { $0.isComplete }.count) / Double(subtasks.count)
//	}
//
//	var isComplete: Bool {
//		return subtaskIDs.allSatisfy { $0.isComplete }
//	}
}
