//
//  CalendarService.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/25.
//

import Foundation
import Alamofire
import SwiftyJSON

class CalendarService {
    static let shared : CalendarService = CalendarService()
    
    func getCalendarData(completionHandler: @escaping (Result<CalendarResponse, Error>)->Void) {
        let requestHeader : HTTPHeaders = [
            "userIndex" : "1"
        ]
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: Date())
        let month = dateFormatter.string(from: Date())
        
        let request = AF.request("\(Config.baseURL)/stamp/\(year)/\(month)", method: .get, headers: requestHeader)
        
        request.responseData { dataResponse  in
            switch dataResponse.result{
            case .success(let successResponse):
                print("response success")
                print(successResponse)
                
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(CalendarResponse.self, from: dataResponse.data!)
                    print("decoding success")
                    completionHandler(.success(decodedData))
                }catch{
                    print("decoding failure")
                    print(error)
                }
            case .failure(let failureResponse):
                print("response failure")
                print(failureResponse)
                completionHandler(.failure(failureResponse))
                
            }
            
        }
        
    }
}
