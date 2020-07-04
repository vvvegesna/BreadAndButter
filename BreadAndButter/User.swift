//
//  User.swift
//  BreadAndButter
//
//  Created by Vegesna, Vijay V EX1 on 7/3/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String
    var name: String
    var age: Int
    var isActive: Bool
    var address: String
    var about: String
    var company: String
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}
