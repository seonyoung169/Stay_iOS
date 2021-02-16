//
//  MyPlaceService.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/12.
//

import Foundation
import SwiftyJSON
import Alamofire

class MyPlaceService {
    static let shared : MyPlaceService = MyPlaceService()
    
    func getMyPlaceList(completionHandler : @escaping (Result<MyPlaceResponse, Error>) -> Void){
        let requestHeader : HTTPHeaders = [
            "userIndex" : "1"
        ]
        
        let request = AF.request("\(Config.baseURL)/place", method: .get, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result{
            case .success(let successResponse):
                print("response success")
                let decoder = JSONDecoder()
                
                do{
                    let decodedData = try decoder.decode(MyPlaceResponse.self, from: dataResponse.data!)
                    print("decoding success")
                    completionHandler(.success(decodedData))
                }catch{
                    print("decoding failure")
                    print(error)
                }
                
            case .failure(let failureResponse):
                print("response success")
                completionHandler(.failure(failureResponse))
            }
        }
        
    }
}
