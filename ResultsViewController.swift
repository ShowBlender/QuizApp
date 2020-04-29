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
    let answer: String
    let wrongAnswer: String?
}

class CorrectAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
}

class WrongAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var wrongAnswerLabel: UILabel!
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
        tableView.register(UINib(nibName: "WrongAnswerCell", bundle: nil), forCellReuseIdentifier: "WrongAnswerCell")
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
        if answer.wrongAnswer == nil {
            return correctAnswerCell(for: answer)
        }
        return wrongAnswerCell(for: answer)
    }
    
    private func correctAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
        cell.questionLabel?.text = answer.question
        cell.answerLabel?.text = answer.answer
        return cell
    }
    
    private func wrongAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WrongAnswerCell") as! WrongAnswerCell
        cell.questionLabel?.text = answer.question
        cell.correctAnswerLabel?.text = answer.answer
        cell.wrongAnswerLabel?.text = answer.wrongAnswer
        return cell
    }
}
