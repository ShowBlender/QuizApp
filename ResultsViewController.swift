//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Joseph McCraw on 4/28/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    var summary = ""
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
    }
    
    convenience init(summary: String) {
        self.init()
        self.summary = summary
        
    }
}
