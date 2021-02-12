//
//  FriendServie.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class FriendService{
    static let shared : FriendService = FriendService()
    
    func getFriendList(completionHandler : @escaping (Result<FriendResponse, Error>) -> Void) {
        let requestHeader : HTTPHeaders = [
            "userIndex" : "1"
        ]
        
        let request = AF.request("\(Config.baseURL)/friend", method: .get, headers: requestHeader )
        
        request.responseData{ dataResponse in
            switch dataResponse.result {
            case .success(let successResponse) :
                print(successResponse)
                
                let decoder = JSONDecoder()
                
                do{
                    let decodedData = try decoder.decode(FriendResponse.self, from: dataResponse.data!)
                    print("decoding success")
                    completionHandler(.success(decodedData))
                    
                }catch{
                    print(error)
                }
                
            case .failure(let failureResponse) :
                print(failureResponse)
                completionHandler(.failure(failureResponse))
            }
        }
        
    }
    
}
