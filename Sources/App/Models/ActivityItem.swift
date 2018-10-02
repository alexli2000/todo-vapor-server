//
//  ActivityItem.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

struct ActivityItem: Codable, Hashable {

	var id: UUID?
	var createdOn: Date
	var activityType: ActivityType
	var itemID: UUID

	init(id: UUID? = nil,
		 createdOn: Date = Date(),
		 activityType: ActivityType,
		 itemID: UUID)
	{
		self.id = id
		self.createdOn = createdOn
		self.activityType = activityType
		self.itemID = itemID
	}
}
