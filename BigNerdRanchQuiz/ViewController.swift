//
//  ViewController.swift
//  BigNerdRanchQuiz
//
//  Created by 10.12 on 2018/8/31.
//  Copyright © 2018 10.12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    var currentIndex = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    // MARK: 2 NSArray Model
    let questionArray:[String] = ["From what is cognac made?",
                                  "what is 7+7?",
                                  "What is the capital of Vermont?"]
    let answerArray:[String] = ["Grapes",
                                "14",
                                "Montpelier"]
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionArray[currentIndex]
    }
    // MARK: Actions
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentIndex += 1
        if currentIndex == questionArray.count {
            currentIndex = 0
        }
        questionLabel.text = questionArray[currentIndex]
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = answerArray[currentIndex]
    }

}

