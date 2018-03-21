//
//  URLComponentz.swift
//  ASmallURLParser
//
//  Created by Jason Kuan on 2018-03-20.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

struct URLComponentz {
	
	var scheme: String
	var host: String.SubSequence
	var user: String?
	var pass: String.SubSequence?
	var path: String.SubSequence?
	var query: [QueryItem]?
	var fragment: String?
	
	init() {
		self.scheme = ""
		self.host = ""
		self.user = ""
		self.pass = ""
		self.path = ""
		self.query = []
		self.fragment = ""
	}
	
	init?(scheme: String, host: String.SubSequence, user: String?, pass: String.SubSequence?, path: String.SubSequence?, query: [QueryItem]?, fragment: String?) {
		self.scheme = scheme
		self.host = host
		self.user = user
		self.pass = pass
		self.path = path
		self.query = query
		self.fragment = fragment
	}
}
