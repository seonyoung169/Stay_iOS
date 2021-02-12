//
//  File.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/10.
//

import Foundation


struct AddressResponse : Codable {
    let results : Results
}

struct Results : Codable{
    let common : Common
    let juso : [AddressData]
}

struct Common : Codable {
    let errorMessage : String
    let countPerPage : String
    let totalCount : String
    let errorCode : String
    let currentPage: String
}

struct AddressData : Codable{
    let roadAddr : String
    let jibunAddr : String
}
