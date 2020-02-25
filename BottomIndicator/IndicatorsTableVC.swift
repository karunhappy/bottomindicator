//
//  IndicatorsTableVC.swift
//  BottomIndicator
//
//  Created by Karun Aggarwal on 07/02/20.
//  Copyright © 2020 Karun Aggarwal. All rights reserved.
//

import UIKit

class IndicatorsTableVC: UITableViewController {

    enum types: String, CaseIterable {
        case StoryBoard, Programatically
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Indicator View Demo"
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IndicatorsTableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = types.allCases[indexPath.row].rawValue
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = UIViewController()
        switch types.allCases[indexPath.row] {
            case .StoryBoard:
                vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
                break
            case .Programatically:
                vc = self.storyboard?.instantiateViewController(identifier: "ProgramaticallyVC") as! ProgramaticallyVC
                break
        }
        self.show(vc, sender: nil)
    }
}
