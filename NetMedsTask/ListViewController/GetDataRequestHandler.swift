//
//  GetDataRequestHandler.swift
//  NetMedsTask
//
//  Created by shashank atray on 11/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation

public protocol GetDataRequestHandlerUseCase {
    func requestForUserDataWith(requestUrl: URL, completionHandler: @escaping(_ result: [TestPackage]) -> ())}

extension GetDataRequestHandlerUseCase {
    
    public func requestForUserDataWith(requestUrl: URL, completionHandler: @escaping(_ result: [TestPackage]) -> ()) {
        
        let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
           do {
                let testPackage = try JSONDecoder().decode([TestPackage].self, from: data)
                completionHandler(testPackage)
                
            } catch {
                print("can not wrap json", error)
            }
        }
        task.resume()
    }
}

public struct GetDataRequestHandler: GetDataRequestHandlerUseCase {
    public init() {}
}
