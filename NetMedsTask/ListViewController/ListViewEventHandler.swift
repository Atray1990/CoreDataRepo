//
//  ListViewEventHandler.swift
//  NetMedsTask
//
//  Created by shashank atray on 11/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation
import UIKit
import CoreData

open class ListViewEventHandler {
    
    weak var viewController: ListViewController?
    let navigator: ListNavigatorRouting
    let requestHandler: GetDataRequestHandler
    
    init(viewController: ListViewController, requestHandler: GetDataRequestHandler, navigator: ListNavigatorRouting) {
        self.viewController = viewController
        self.requestHandler = requestHandler
        self.navigator = navigator
    }
    
    func fetchChatdata() {
        let url = URL(string: "https://5f1a8228610bde0016fd2a74.mockapi.io/getTestList")!
        requestHandler.requestForUserDataWith(requestUrl: url) { result in
            
            if !(result.isEmpty) {
                self.viewController?.showTestData(testData: result)
                self.viewController?.saveTestData(testData: result)
            }
        }
    }
    
    func moveToCartScreen(navController: UINavigationController, selectedTest:[TestPackage]) {
       navigator.makeCartViewController(from: navController, selectedTest: selectedTest)
    }
    
    func searchThroughData(testData: [TestPackage], searchString: String){
        var search: [TestPackage] = []
        for index in 0..<testData.count {
            if let keyWord = testData[index].Keyword, keyWord.contains(searchString) {
                search.append(testData[index])
            }
        }
        self.viewController?.showTestData(testData: search)
    }
    
    func deleteAllCoreDataValues() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TestData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch
        {
            print ("There was an error")
        }
    }
    
    func saveDataToCoreData(testData: [TestPackage],navController: UINavigationController) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TestData", in: context)

        for index in 0...testData.count - 1 {
            let managedObject = NSManagedObject(entity: entity!, insertInto: context)
            managedObject.setValue(testData[index].Sno, forKey: "sno")
            managedObject.setValue(testData[index].type, forKey: "type")
            managedObject.setValue(testData[index].minPrice, forKey: "minprice")
            managedObject.setValue(testData[index].itemId, forKey: "itemid")
            managedObject.setValue(testData[index].itemName, forKey: "itemname")
            managedObject.setValue(testData[index].availableAt, forKey: "availableat")
            do {
                try context.save()
            } catch {
                print("didnt save")
            }
           
        }
        navigator.makeCartViewControllerUsingCoreData(from: navController)
    }
    

}
