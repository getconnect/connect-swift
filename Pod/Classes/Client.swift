//
//  Client.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct Client {
    
    let connectConfig: ConnectConfig
    
    var headers: [String: String] {
        return [
            "X-Project-Id": connectConfig.projectId,
            "X-Api-Key": connectConfig.apiKey
        ]
    }
    
    var queryUrl: NSURL {
        return NSURL(string: connectConfig.baseUrl + "/events/")!
    }
    
    init(connectConfig: ConnectConfig) {
        self.connectConfig = connectConfig
    }
    
    func query(collection: String, parameters: [String: AnyObject], completion: Result<JSON, NSError> -> Void) {
        
        let url = NSURL(string: collection, relativeToURL: queryUrl)! // TODO remove this force un-wrap
        
        let jsonString = JSON(parameters).rawString(NSUTF8StringEncoding, options: NSJSONWritingOptions(rawValue: 0))! // TODO remove this force un-wrap
        let urlParams = ["query": jsonString]
        
        let request = Alamofire.request(.GET, url, parameters: urlParams, encoding: .URLEncodedInURL, headers: headers)
        
        request.validate().responseJSON {
            (response) in
            switch response.result {
            case .Success:
                guard let value = response.result.value else {
                    completion(Result.Failure(NSError(domain: "", code: 0, userInfo: nil))) // TODO: add proper errors
                    return
                }
                let json = JSON(value)
                completion(Result.Success(json))
            case .Failure(let error):
                completion(Result.Failure(error))
            }
        }
    }
    
}

