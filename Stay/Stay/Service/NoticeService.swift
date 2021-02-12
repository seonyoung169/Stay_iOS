//
//  NoticeService.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/31.
//

import Foundation
import Alamofire
import SwiftyJSON

class NoticeService {
    static let shared : NoticeService = NoticeService()
    
    func getNoticeList(completionHandler : @escaping (Result<NoticeResponse, Error>) -> Void){
        let requestHeader : HTTPHeaders = [
            "userIndex" : "1"
        ]
        
        let request = AF.request("\(Config.baseURL)/notice", method: .get, headers: requestHeader)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse) :
                print("response success")
                print(successResponse)
                
                let decoder = JSONDecoder()
                do{
                    let decodedData = try decoder.decode(NoticeResponse.self, from: dataResponse.data!)
                    print("decoding success")
                    completionHandler(.success(decodedData))
                }catch{
                    print("decoding failure")
                    print(error)
                }
                
            case .failure(let failureResponse) :
                print("response failure")
                completionHandler(.failure(failureResponse))
                
            }
        }
    }
}
