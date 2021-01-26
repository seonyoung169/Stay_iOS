//
//  CalendarModel.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/25.
//

import Foundation

struct CalendarResponse : Codable {
    let status : Int
    let message : String
    let data : CalendarData
}

struct CalendarData : Codable {
    let record : Record
    let stamp : [Stamp]
}

struct Record : Codable {
    let currentRecord : Int
    let bestRecord : Int
}

struct Stamp : Codable {
    let date : String
    let get : Bool
}
