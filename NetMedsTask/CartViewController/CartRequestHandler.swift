//
//  CartRequestHandler.swift
//  NetMedsTask
//
//  Created by shashank atray on 13/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public protocol CartRequestHandlerUseCase {
    func coreDataFetch(completionHandler: @escaping(_ result: [NSManagedObject]) -> ())}

extension CartRequestHandlerUseCase {
    
    public func coreDataFetch(completionHandler: @escaping(_ result: [NSManagedObject]) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TestData")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            if let data = result as? [NSManagedObject] {
                completionHandler(data)
            }
            
        } catch {
            print("Failed")
        }
    }
}

public struct CartRequestHandler: CartRequestHandlerUseCase {
    public init() {}
}
