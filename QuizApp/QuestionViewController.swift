//
//  QuestionViewController.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 4/27/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var question: String = ""
    private var options: [String] = []
    
    convenience init(question: String, options: [String]) {
        self.init()
        self.question = question
        self.options = options
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = question
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
