//
//  MyPlaceModel.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/12.
//

import Foundation


struct MyPlaceResponse :Codable {
    let status : Int
    let message : String
    let data : [MyPlaceData]
}

struct MyPlaceData :Codable {
    let id : Int
    let name : String
    let address : String
}
