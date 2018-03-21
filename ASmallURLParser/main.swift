//
//  main.swift
//  ASmallURLParser
//
//  Created by Jason Kuan on 2018-03-20.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

let query = "key1=value1&key2=value2"
let url = "https://username:password@example.com/path?\(query)#anchor"

let parser = URLParser()
let urlComponents = parser.parse(url: url)

print(" Scheme: \(urlComponents.scheme)\n User: \(urlComponents.user!)\n Password: \(urlComponents.pass!)\n Host: \(urlComponents.host)\n Path: \(urlComponents.path!)\n Query: \(urlComponents.query!)\n Fragment: \(urlComponents.fragment!)\n")



