//
//  AccessControl.swift
//  TodoIOS
//
//  Created by Kristina Quicho on 2018-10-02.
//  Copyright © 2018 Alex Li. All rights reserved.
//

import Foundation

enum AccessControl: String, Codable, Hashable {

	case readOnly
	case writeOnly
	case readWrite
}
