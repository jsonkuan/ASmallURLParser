//
//  QueryItem.swift
//  ASmallURLParser
//
//  Created by Jason Kuan on 2018-03-20.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

struct QueryItem {
	
	let name: String
	let value: String?
	
	init(name: String, value: String?) {
		self.name = name
		self.value = value
	}
	
}
