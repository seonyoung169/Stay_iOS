//
//  HomeModel.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/30.
//

import Foundation


struct HomeResponse : Codable{
    let status : Int
    let message : String
    let data : HomeData
}

struct HomeData : Codable{
    let corona : Corona
    let currentRecord : Int
}

struct Corona : Codable{
    let stateDt : String
    let decideCnt : String
    let distancingNum : Int
}
