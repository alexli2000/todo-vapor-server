//
//  Subtask.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

struct Subtask: Codable, Hashable {

	var id: UUID?
	var title: String
	var createdOn: Date
	var dueDate: Date?
	var isComplete: Bool
	var taskID: Task.ID

	init(id: UUID? = nil,
		 title: String,
		 createdOn: Date = Date(),
		 dueDate: Date? = nil,
		 isComplete: Bool = false,
		 taskID: Task.ID)
	{
		self.id = id
		self.title = title
		self.createdOn = createdOn
		self.dueDate = dueDate
		self.isComplete = isComplete
		self.taskID = taskID
	}
}
