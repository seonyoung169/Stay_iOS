//
//  AddPlaceService.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/17.
//

import Foundation
import Alamofire
import SwiftyJSON

class AddPlaceService {
    static let shared : AddPlaceService = AddPlaceService()
    
    func addPlace(completionHandler : @escaping (Result<AddPlaceResponse, Error>) -> Void){
        let requestHeader : HTTPHeaders = [
            "userIndex" : "1"
        ]
        
        let placeData : [String : String] = [ "name" : "학교", "address" : "서울 특별시 중구" ]
        
        let request = AF.request("\(Config.baseURL)/place", method: .post, parameters: placeData, encoding: JSONEncoding.default, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse) :
                print("response success")
                print(JSON(successResponse))
                
            case .failure(let failureResponse) :
                print("response failure")
                print(failureResponse)
            }
            
        }
    }
}
