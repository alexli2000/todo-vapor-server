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
	var fromUser: User
	var onSubtask: Subtask

	init(id: UUID? = nil,
		 createdOn: Date = Date(),
		 text: String,
		 fromUser: User,
		 onSubtask: Subtask)
	{
		self.id = id
		self.createdOn = createdOn
		self.text = text
		self.fromUser = fromUser
		self.onSubtask = onSubtask
	}
}
