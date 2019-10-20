//
//  ServiceHandler.swift
//  Footbolico
//
//  Created by Rushikesh Bhapkar on 20/10/19.
//  Copyright © 2019 Rushikesh Bhapkar. All rights reserved.
//
//  ServiceHandler : used to load the data from the server
//

import UIKit

class ServiceHandler: NSObject {
    
    static let sharedInstance = ServiceHandler()
    
    func loadData(onSuccess: @escaping([Match]) -> Void, onFailure: @escaping() -> Void){
        let serviceUrl = "https://sports-app-code-test.herokuapp.com/api/events?date=today" // TODO : remove this into common config file
              guard let url = URL(string: serviceUrl) else { return }
              URLSession.shared.dataTask(with: url) { (data, response, err) in
                  guard let data = data else { return }
                  do {
                      let matches = try JSONDecoder().decode([Match].self, from: data)
                      //print(matches)
                      onSuccess(matches)
                  } catch let jsonErr {
                      print("Error serializing json:", jsonErr)
                        onFailure()
                  }
              }.resume()
    }
}
