//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Joseph McCraw on 4/28/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource {

    
    var summary = ""
    var answers = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        headerLabel.text = summary
    }
    
    convenience init(summary: String, answers: [String] = []) {
        self.init()
        self.summary = summary
        self.answers = answers
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = answers[indexPath.row]
        return cell
    }
}
