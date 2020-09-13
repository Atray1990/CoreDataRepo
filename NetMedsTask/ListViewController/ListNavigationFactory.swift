//
//  ListNavigationFactory.swift
//  NetMedsTask
//
//  Created by shashank atray on 12/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

/*
    Factory class to create new classes navigational value from here, same can be done for cart screen but didnt have much to navigate there.
 */

import Foundation
import UIKit

public protocol ListNavigatable {
    func makeListViewController(from navController: UINavigationController)
    func makeCartViewController(from navController: UINavigationController, selectedTest:[TestPackage])
    func makeCartViewControllerUsingCoreData(from navController: UINavigationController)
}

extension ListNavigatable { 
    public func makeListViewController(from navController: UINavigationController) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        let requestHandler = GetDataRequestHandler()
        let navigator = ListNavigatorRouting()
        let eventHandler = ListViewEventHandler.init(viewController: viewController, requestHandler: requestHandler, navigator: navigator)
        viewController.eventHandler = eventHandler
        navController.pushViewController(viewController, animated: true)
    }
    
    public func makeCartViewController(from navController: UINavigationController, selectedTest:[TestPackage]) {
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        viewController.testPackage = selectedTest
        let navigator = CartNavigatorRouting()
        let eventHandler = CartEventHandler.init(viewController: viewController, navigator: navigator)
        viewController.eventHandler = eventHandler
        navController.pushViewController(viewController, animated: true)
    }
    
    public func makeCartViewControllerUsingCoreData(from navController: UINavigationController) {
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        let navigator = CartNavigatorRouting()
        let requestHandler = CartRequestHandler()
        let eventHandler = CartEventHandler.init(viewController: viewController,requestHandler:requestHandler ,navigator: navigator)
        viewController.eventHandler = eventHandler
        viewController.isCoreDataNav = true
        navController.pushViewController(viewController, animated: true)
    }

}

open class ListNavigatorRouting: ListNavigatable {
    public init() {
    }
}
