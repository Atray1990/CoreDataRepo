//
//  TableViewDataSource.swift
//  NetMedsTask
//
//  Created by shashank atray on 11/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation
import UIKit


class TableViewDataSource: NSObject, UITableViewDataSource  {
    
    var testData: [TestPackage]?
    var listViewBool = true
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let testData = testData {
            return testData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let testCell:TestTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        
           if let testDataArray = testData, let testValue = testDataArray[indexPath.row] as? TestPackage {
            testCell.configureCellValue(testPackage: testValue)
            if listViewBool {
                testCell.ivSelectedImage.image = UIImage(named: "icon_add")
            }
        }
        
        return testCell
    }

    
}
