//
//  HomeService.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/30.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeService {
    static let shared : HomeService = HomeService()
    
    func getHomeData(completionHandler : @escaping (Result<HomeResponse, Error>) -> Void){
        let requestHeader : HTTPHeaders = [
            "userIndex" : "1"
        ]
        
        let request = AF.request("\(Config.baseURL)/home", method : .get, headers : requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse) :
                print("response success")
                print(JSON(successResponse))
                
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(HomeResponse.self, from: dataResponse.data!)
                    print("decode success")
                    completionHandler(.success(decodedData))
                }catch{
                    print("decode failure")
                    print(error)
                }
            case .failure(let failureResponse) :
                print("response failure")
                print(failureResponse)
            }
            
        }
    }
}
