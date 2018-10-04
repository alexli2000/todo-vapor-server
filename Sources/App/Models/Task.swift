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
//	var projectID: Project.ID
	var dueDate: Date?
	var progressStatus: TaskProgressStatus.RawValue

	init(id: ID? = nil,
		 title: String,
		 createdOn: Date,
		 creatorID: User.ID,
//		 projectID: Project.ID,
		 dueDate: Date?,
		 progressStatus: TaskProgressStatus = .toDo)
	{
		self.id = id
		self.title = title
		self.createdOn = createdOn
		self.creatorID = creatorID
//		self.projectID = projectID
		self.dueDate = dueDate
		self.progressStatus = progressStatus.rawValue
	}
}
