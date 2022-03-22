//
//  ViewController.swift
//  Hangman
//
//  Created by Sunny on 3/22/22.
//

import UIKit

class ViewController: UIViewController {
    var wordCountLabel: UILabel!
    var answerLabel: UILabel!
    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        wordCountLabel = UILabel()
        wordCountLabel.translatesAutoresizingMaskIntoConstraints = false
        wordCountLabel.font = UIFont.systemFont(ofSize: 12)
        wordCountLabel.text = "COUNT"
        wordCountLabel.numberOfLines = 0
        view.addSubview(wordCountLabel)
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = UIFont.systemFont(ofSize: 24)
        answerLabel.text = "ANSWERS"
        answerLabel.numberOfLines = 0
        view.addSubview(answerLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40),
            answerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            
            wordCountLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20),
            wordCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

