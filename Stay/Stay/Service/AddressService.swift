//
//  AddressService.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/10.
//

import Foundation
import Alamofire
import SwiftyJSON

class AddressService {
    static let shared : AddressService = AddressService()
    
    func getAddressSearchResult(keyword : String, completionHandler : @escaping (Result<AddressResponse, Error>) -> Void){
        print("getAddressSearchResult")
        
        let url = "https://www.juso.go.kr/addrlink/addrLinkApi.do"
        
        let params : [String : Any] = [
            "confmKey" : Config.addressConfirmKey,
            "currentPage" : 1,
            "countPerPage" : 10,
            "keyword" : keyword,
            "resultType" : "json",
            "hstryYn" : "N",
            "firstSort" : "none",
            "addInfoYn" : "N"
        ]
        
        let request = AF.request(url, method: .get, parameters: params)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success(let successResponse) :
                print("response success")
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(AddressResponse.self, from: dataResponse.data!)
                    print("decoding success")
                    completionHandler(.success(decodedData))
                }catch{
                    print("decoding fail")
                    print(error)
                    completionHandler(.failure(error))
                }
            
            case .failure(let failureResponse) :
                print("response failure")
                print(failureResponse)
            }
            
        }
    }
    
}
