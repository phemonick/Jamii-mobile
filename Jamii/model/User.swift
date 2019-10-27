//
//  User.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import Foundation


struct User : Codable {
    let error: String?
    let payload: Payload?
    let status: Int?
}

// MARK: - Payload
struct Payload : Codable{
    let newUser: NewUser
    let token: String
}

// MARK: - NewUser
struct NewUser : Codable {
    let _id, fullName, email, password: String?
    let location: String?
    let __v: Int?
}
