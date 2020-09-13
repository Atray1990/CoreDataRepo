//
//  TestPackageModal.swift
//  NetMedsTask
//
//  Created by shashank atray on 11/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation
import UIKit


public struct TestPackage : Decodable  {
    let Sno: Int
    let itemId: String
    let itemName: String
    let type: String
    let Keyword: String?
    let testCount: Int?
    let Included_Tests: String?
    let url: String?
    let minPrice: Int
    let labName: String?
    let fasting: Int?
    let availableAt: Int
    let popular: String?
    let category: String?
    let objectID: String?
    let bestSellers: String? // making not necessary values as optional as some data modal doesnt have them plus want to use same modal for core data
    
    //map 'S.no' from JSON to 'Sno' lly for Included Tests and Best-sellers, included tests and bestSellers since they had different format rest have been left alone.
    enum CodingKeys : String, CodingKey {
        case Sno = "S.no"
        case itemId
        case itemName
        case type
        case Keyword
        case testCount
        case Included_Tests = "Included Tests"
        case url
        case minPrice
        case labName
        case fasting
        case availableAt
        case popular
        case category
        case objectID
        case bestSellers = "Best-sellers"
    }
    
}
