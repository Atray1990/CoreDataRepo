//
//  CommonCategories.swift
//  FlickerUIViewProject
//
//  Created by shashank atray on 11/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation
import UIKit

extension NSObject{

    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        
        if let data = (text as AnyObject).data(using: String.Encoding.utf8.rawValue){
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                
                return json
                
            } catch {
                return nil
            }
        }
        return nil
    }
}


// extension for textfield
extension UITextField
{
    // MARK :- Methods for providing paddign to textfield
    func textFieldPadding()
    {
        self.leftViewMode = UITextField.ViewMode.always
        self.layer.borderWidth = 1.0
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
    }
    
    func LatentBorderColor()
    {
        self.layer.borderColor = UIColor(red: 179.0/255.0, green: 179.0/255.0, blue: 179.0/255.0, alpha: 1.0).cgColor
    }
    func ActiveBorderColor(){
        self.layer.borderColor = UIColor(red: 41.0/255.0, green: 41.0/255.0, blue: 41.0/255.0, alpha: 1.0).cgColor
    }
 
}

// Uiimage view
extension UIImageView
{
    func DownloadImageForCollectionView (from url : String, completion: ((_ errorMessage: String?) -> Void)?){
        if url.count == 0
        {
            return
        }
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest){ (data,response,error) in
            
            if error != nil {
                completion?("error...")
            }
            
            DispatchQueue.main.async {
                if data != nil{
                    self.image = UIImage(data:data!)
                    
                }
                completion?(nil)
            }
        }
        
        task.resume()
    }
}

// value or states of string

extension String
{
    func trimmedString() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
   
}


