//
//  Event.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//



import Foundation

// MARK: - Event
struct Event : Codable{
    let error: String?
    let payload: [EventData]?
    let status: Int?
}

// MARK: - Payload
struct EventData : Codable {
    let neededDonation, numberOfParticipants: Int?
    let id, userID, title, payloadDescription: String?
    let image, itemsNeeded, eventDate, eventLocation: String?
    let category: String?
    let v: Int?
}
