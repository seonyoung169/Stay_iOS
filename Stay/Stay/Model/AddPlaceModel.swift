//
//  AddPlaceModel.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/17.
//

import Foundation

struct NewPlaceData {
    let name : String
    let address : String
}

struct AddPlaceResponse {
    let status : Int
    let message : String
    let data : PlaceData
}

struct PlaceData {
    let id : Int
}
