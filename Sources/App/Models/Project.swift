//
//  Project.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

struct Project: Codable, Hashable {

	var id: UUID?
	var createdOn: Date
	var archiveState: ArchiveState
	var access: [User: AccessControl]
	var tasks: [Task]
	var imageURL: String?

	init(id: UUID? = nil,
		 createdOn: Date = Date(),
		 createdBy creator: User,
		 archiveState: ArchiveState = .notArchived,
		 tasks: [Task] = [],
		 imageURL: String? = nil)
	{
		self.id = id
		self.createdOn = createdOn
		self.archiveState = archiveState
		self.tasks = tasks
		self.access = [creator: .readWrite]
		self.imageURL = imageURL
	}
}
