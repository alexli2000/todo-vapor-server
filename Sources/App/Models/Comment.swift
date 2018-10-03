//
//  Comment.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

struct Comment: Codable, Hashable {

	var id: UUID?
	var createdOn: Date
	var text: String
	var fromUserID: User.ID
	var onSubtaskID: Subtask.ID

	init(id: UUID? = nil,
		 createdOn: Date = Date(),
		 text: String,
		 fromUserID: User.ID,
		 onSubtaskID: Subtask.ID)
	{
		self.id = id
		self.createdOn = createdOn
		self.text = text
		self.fromUserID = fromUserID
		self.onSubtaskID = onSubtaskID
	}
}
