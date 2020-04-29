//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Joseph McCraw on 4/28/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import UIKit

struct PresentableAnswer {
    let question: String
    let isCorrect: Bool
}

class CorrectAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    
}

class WrongAnswerCell: UITableViewCell {
    
}

class ResultsViewController: UIViewController, UITableViewDataSource {

    
    var summary = ""
    var answers = [PresentableAnswer]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        headerLabel.text = summary
        tableView.register(UINib(nibName: "CorrectAnswerCell", bundle: nil), forCellReuseIdentifier: "CorrectAnswerCell")
    }
    
    convenience init(summary: String, answers: [PresentableAnswer] = []) {
        self.init()
        self.summary = summary
        self.answers = answers
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.isCorrect {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
            cell.questionLabel?.text = answer.question
            return cell
//            return tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell")!
        }
        return WrongAnswerCell()
    }
}
