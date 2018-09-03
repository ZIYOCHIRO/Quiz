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
    // 2 NSArray Model
    let questionArray:[String] = ["From what is cognac made?",
                                  "what is 7+7?",
                                  "What is the capital of Vermont?"]
    let answerArray:[String] = ["Grapes",
                                "14",
                                "Montpelier"]
    
    // MARK: Outlets
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var currentQuestionLabelCenterXConstrains: NSLayoutConstraint!
    
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabelCenterXConstrains: NSLayoutConstraint!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    // MARK: Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.currentQuestionLabel.alpha = 1
        self.nextQuestionLabel.alpha = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questionArray[currentIndex]
        
        updateOffScreenLabel()
    }
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstrains.constant = -screenWidth
    }
    
    // MARK: Actions
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentIndex += 1
        if currentIndex == questionArray.count {
            currentIndex = 0
        }
        nextQuestionLabel.text = questionArray[currentIndex]
        answerLabel.text = "???"
        animateLabelTransitions()
    }
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = answerArray[currentIndex]
    }
    
    // MARK: Animate the alpha and centerX constrains
    func animateLabelTransitions() {
        // Force any outstanding layout changes to accour
        view.layoutIfNeeded()
        // Animate the centerX constrains
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstrains.constant = 0
        self.currentQuestionLabelCenterXConstrains.constant += screenWidth
        // Animate the alpha
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
                        
        },
                       completion: { _ in
                        swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstrains, &self.nextQuestionLabelCenterXConstrains)
                        self.updateOffScreenLabel()
        })
        
    }
    
    

}

