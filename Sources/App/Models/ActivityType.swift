//
//  ActivityType.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

enum ActivityType: String, Codable, Hashable {

	// Creation
	case createdProject
	case createdTask
	case createdSubtask

	// Completion
	case completedSubtask

	// Comment
	case commentedOnTask

	// Deletion
	case deletedSubtask
	case deletedTask
	case deletedProject
}
