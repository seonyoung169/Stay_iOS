//
//  NoticeModel.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/31.
//

import Foundation

struct NoticeResponse : Codable {
    let status : Int
    let message : String
    let data : [NoticeData]
}

struct NoticeData : Codable {
    let id : Int
    let title : String
    let createdDate : String
}
