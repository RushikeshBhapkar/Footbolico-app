//
//  SecondViewController.swift
//  Footbolico
//
//  Created by Rushikesh Bhapkar on 19/10/19.
//  Copyright © 2019 Rushikesh Bhapkar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: "https://vglive.no/")
               let requestObj = URLRequest(url: url!)
               webView.loadRequest(requestObj)
    }


}

