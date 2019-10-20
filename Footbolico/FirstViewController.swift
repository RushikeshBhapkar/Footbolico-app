//
//  FirstViewController.swift
//  Footbolico
//
//  Created by Rushikesh Bhapkar on 19/10/19.
//  Copyright © 2019 Rushikesh Bhapkar. All rights reserved.
//

import UIKit

class FirstViewController: CollapsibleTableVC {

    var menu = [SectionItemProtocol]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var todaysTimeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO : Remove this in commom utility class
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        todaysTimeLabel.text = dateString
        
        
        ServiceHandler.sharedInstance.loadData(onSuccess: { matches in // Success
            DispatchQueue.main.async {
                //update UI here
                self.menu = ModelBuilder.modelGenerator(matches: matches)
                self.tableView.tableFooterView = UIView()
                self.tableView.reloadData()
            }
    
        }) { // Failure
            let alert = UIAlertController(title: "Error", message: "Error while loading data", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                    self.show(alert, sender: nil)
        }
    }

    //MARK: -
     //MARK: Protocol Conformance
     override func model() -> [SectionItemProtocol]? {
         return menu
     }
     
     override func sectionHeaderNibName() -> String? {
         return "SectionHeaderView"
     }
     
     override func singleOpenSelectionOnly() -> Bool {
         return true
     }
     
     override func collapsibleTableView() -> UITableView? {
         return tableView
     }
    
    func showModal() {
        let modalViewController = SecondViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
}

extension FirstViewController {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt : ", indexPath)
    }
}
