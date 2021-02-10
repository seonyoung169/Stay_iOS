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
    let countPerPage : Int
    let totalCount : Int
    let errorCode : String
}

struct AddressData : Codable{
    let roadAddr : String
    let jibunAddr : String
}

//    let roadAddr : String
//    let roadAddrPart1 : String
//    let roadAddrPart2 : String
//    let jibunAddr : String
//    let engAddr : String
//    let zipNo : String
//    let admCd : String
//    let rnMgtSn : String
//    let bdMgtSn : String
//    let detBdNmList : String
//    let bdNm : String
//    let bdKdcd : String
//    let siNm : String
//    let sggNm : String
//    let emdNm : String
//    let liNm : String
//    let rn : String
//    let udrtYn : String
//    let buldMnnm : Int
//    let buldSlno : Int
//    let mtYn : String
//    let lnbrMnnm : Int
//    let lnbrSlno :  Int
//    let emdNo : String
//    let hstryYn : String
//    let relJibun : String
//    let hemdNm : String
