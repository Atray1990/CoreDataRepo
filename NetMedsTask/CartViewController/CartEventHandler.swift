//
//  CartEventHandler.swift
//  NetMedsTask
//
//  Created by shashank atray on 12/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation
import UIKit
import CoreData


open class CartEventHandler {

weak var viewController: CartViewController?
let navigator: CartNavigatorRouting
let requestHandler: CartRequestHandler?

init(viewController: CartViewController, requestHandler: CartRequestHandler? = nil , navigator: CartNavigatorRouting) {
    self.viewController = viewController
    self.requestHandler = requestHandler
    self.navigator = navigator
}
    
    func priceCalculation(testData:[TestPackage]) -> Int {
        var price = 0
        for index in 0..<testData.count {
            price = price + testData[index].minPrice
        }
        return price
    }
    
    func getCoreData() {
        requestHandler?.coreDataFetch{ result in   // call to request handle to return the data
            
            if !(result.isEmpty) {
                let testData = self.handleDataFromCoreData(testData:result )
                self.viewController?.showTestData(testData:testData )
                self.viewController?.updatePriceSection(testData: testData)
            }
        }
    }
    
    func handleDataFromCoreData(testData: [NSManagedObject]) -> [TestPackage] {
        
        // binding core data to pre-exiting modal and reusing the modal
        let testPackage: [TestPackage] = testData.map { testDataDict in
            
            let itemName = testDataDict.value(forKey: "itemname") as? String ?? ""
            let sno = testDataDict.value(forKey: "sno") as? Int ?? 0
            let availAt = testDataDict.value(forKey: "itemname") as? Int ?? 0
            let itemId = testDataDict.value(forKey: "itemid") as? String ?? ""
            let minPrice = testDataDict.value(forKey: "minprice") as? Int ?? 0
            let type = testDataDict.value(forKey: "type") as? String ?? ""
            
            let testPackage = TestPackage(Sno: sno, itemId: itemId, itemName: itemName, type: type, Keyword: nil, testCount: nil, Included_Tests: nil, url: nil, minPrice: minPrice, labName: nil, fasting: nil, availableAt: availAt, popular: nil, category: nil, objectID: nil, bestSellers: nil)
            return testPackage
        }
        return testPackage
    }
}
