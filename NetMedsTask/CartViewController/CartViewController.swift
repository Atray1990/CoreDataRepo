//
//  CartViewController.swift
//  NetMedsTask
//
//  Created by shashank atray on 12/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var payButton:UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var subTotal: UILabel!
    
    var testPackage: [TestPackage] = []
    let tableViewDataSource = TableViewDataSource()  // ReUsing same dataSource since UI is same a new can be created if needed
    var eventHandler: CartEventHandler!
    var isCoreDataNav:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }

    func setUpViews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popBack))
        navigationItem.title = "Cart"
        
        self.cartTableView.dataSource = tableViewDataSource // using preExisting data source
        if isCoreDataNav {
            getCoreDataValues()
        } else {
            updatePriceSection(testData: testPackage)
            showTestData(testData: testPackage)
        }
    }
    
    func getCoreDataValues() {
        eventHandler.getCoreData()
    }
    
    // MARK: - Navigation Here is the Api : https://5f1a8228610bde0016fd2a74.mockapi.io/getTestList
       @objc func popBack() {
           self.navigationController?.popViewController(animated: true)
       }
    
    func updatePriceSection(testData: [TestPackage]) {
        self.lblCount.text = "\(testData.count)"
        let price = eventHandler.priceCalculation(testData: testData)
        self.lblPrice.text = "Rs \(price)"
        self.subTotal.text = "Rs \(price - 30)"
    }

    func showTestData(testData: [TestPackage]) {
        self.tableViewDataSource.testData = testData
        self.tableViewDataSource.listViewBool = false
        self.testPackage = testData
        DispatchQueue.main.async {
            self.cartTableView.reloadData()
        }
        
    }
}
