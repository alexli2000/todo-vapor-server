//
//  User.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

struct User: Codable, Hashable {

	var id: UUID?
	var username: String
	var createdOn: Date
	var profileImageURL: String?

	init(id: UUID? = nil,
		 username: String,
		 createdOn: Date = Date(),
		 profileImageURL: String? = nil)
	{
		self.id = id
		self.username = username
		self.createdOn = createdOn
		self.profileImageURL = profileImageURL
	}
}
