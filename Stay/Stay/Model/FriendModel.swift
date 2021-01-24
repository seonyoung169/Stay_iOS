//
//  FriendData.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/20.
//

import Foundation

struct FriendResponse : Codable{
    let status : Int
    let message : String
    let data : FriendData
}

struct FriendData : Codable {
    let user : User
    let friends : [Friend]
}

struct User : Codable {
    let name : String
    let profileImage : String
    let currentRecord : Int
}
struct Friend : Codable {
    let name : String
    let profileImage : String
    let isPrivate : Bool
    let currentRecord : Int
    let rank : Int
}
