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
	var access: [User.ID: AccessControl]
	var taskIDs: [Task.ID]
	var imageURL: String?

	init(id: UUID? = nil,
		 createdOn: Date = Date(),
		 createdBy creatorID: User.ID,
		 archiveState: ArchiveState = .notArchived,
		 taskIDs: [Task.ID] = [],
		 imageURL: String? = nil)
	{
		self.id = id
		self.createdOn = createdOn
		self.archiveState = archiveState
		self.taskIDs = taskIDs
		self.access = [creatorID: .readWrite]
		self.imageURL = imageURL
	}
}
