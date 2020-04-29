//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Joseph McCraw on 4/28/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var summary = ""
    var answers = [PresentableAnswer]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        headerLabel.text = summary
        tableView.register(CorrectAnswerCell.self)
        tableView.register(WrongAnswerCell.self)
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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return answers[indexPath.row].wrongAnswer == nil ? 70 : 90
    }
    
    private func correctAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(CorrectAnswerCell.self)!
        cell.questionLabel?.text = answer.question
        cell.answerLabel?.text = answer.answer
        return cell
    }
    
    private func wrongAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(WrongAnswerCell.self)!
        cell.questionLabel?.text = answer.question
        cell.correctAnswerLabel?.text = answer.answer
        cell.wrongAnswerLabel?.text = answer.wrongAnswer
        return cell
    }
}
