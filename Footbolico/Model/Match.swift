//
//  Match.swift
//  Footbolico
//
//  Created by Rushikesh Bhapkar on 20/10/19.
//  Copyright © 2019 Rushikesh Bhapkar. All rights reserved.
//
//  Model class
//

import UIKit
// MARK: - Match
struct Match: Decodable {
    let id: Int?
    let name: String?
    let logoUrl: String?
    let events:[Event]?
}
// MARK: - Event
struct Event: Decodable {
    let id: Double?
    let startDate: String?
    let homeTeam, awayTeam: team
    let result: Result
    let status: Status
}
// MARK: - team
struct team : Decodable{
    var id : String?
    var name : String?
    var logoUrl : String?
    var isWinner : Bool?
}
// MARK: - Result
struct Result: Decodable {
    let runningScore: RunningScore
}
// MARK: - RunningScore
struct RunningScore: Decodable {
    let home, away: Int
}
// MARK: - Status
struct Status: Decodable {
    let type: String?
}
