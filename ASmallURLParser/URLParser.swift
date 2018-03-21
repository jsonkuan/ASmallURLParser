//
//  URLParser.swift
//  ASmallURLParser
//
//  Created by Jason Kuan on 2018-03-20.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

struct URLParser {
	
	let errorCode = URLErrorz()
	
	func prettyPrint(url: String) -> String {
		
		let scheme = getScheme(url: url)
		let host = getHost(url: url)
		let username = getUserName(url: url)
		let password = getPassword(url: url)
		let path = getPath(url: url)
		let query = getQueryItems(url: url)
		let anchor = getFragment(url: url)
		
		return " Scheme: \(scheme)\n User: \(username)\n Password: \(password)\n Host: \(host)\n Path: \(path)\n Query: \(query)\n Fragment: \(anchor)\n"
	}
	
	func parse(url: String) -> URLComponentz {
		
		let components = URLComponentz.init(scheme: getScheme(url: url),
											host: getHost(url: url),
											user: getUserName(url: url),
											pass: getPassword(url: url),
											path: getPath(url: url),
											query: getQueryItems(url: url),
											fragment: getFragment(url: url))!
		return components
	}
	
	private func getScheme(url: String) -> String {
		let scheme = url.components(separatedBy: "://")
		
		guard scheme[0].elementsEqual("http") || scheme[0].elementsEqual("https") else {
			fatalError("\(errorCode.badURL)")
		}
		
		return scheme[0]
	}
	
	private func getUserName(url: String) -> String {
		let components = url.components(separatedBy: ":")
		
		guard components.count == 3 else {
			fatalError(errorCode.needAuth)
		}
		
		let user = components[1].components(separatedBy: "//")
		return user[1]
	}
	
	private func getPassword(url: String) -> String.SubSequence {
		let components = url.components(separatedBy: ":")
		guard components.count == 3 else { fatalError(errorCode.needAuth) }
		let password = components[2].split(separator: "@")
		return password[0]
	}
	
	private func getHost(url: String) -> String.SubSequence {
		
		let components = url.components(separatedBy: "@")
		let host = components[1].split(separator: "/")
		
		guard host[0].contains(".") else {
			fatalError("\(errorCode.invalidHost)")
		}
		
		return host[0]
	}
	
	private func getPath(url: String) -> String.SubSequence {
		let components = url.components(separatedBy: "?")
		let path = components[0].split(separator: "/")
		
		return path.count == 3 ? path[2] : ""
	}
	
	private func getFragment(url: String) -> String {
		let components = url.components(separatedBy: "#")
		return components.count == 2 ? components[1] : ""
	}
	
	private func getQueryItems(url: String) -> [QueryItem] {
		
		let components = url.components(separatedBy: "?")
		let urlQuery = components[1].components(separatedBy: "#")
		let urlQueryItems = urlQuery[0]
		let queryItems = urlQueryItems.components(separatedBy: "&")
		
		var items: [QueryItem] = []
		
		for item in queryItems {
			
			let queryItems = item.components(separatedBy: "=")
			let key = queryItems[0]
			let value = queryItems[1]
			
			let queryItem = QueryItem(name: key, value: value)
			items.append(queryItem)
		}
		return items
	}
	
}
