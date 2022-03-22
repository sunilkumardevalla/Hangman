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
        wordCountLabel.font = UIFont.systemFont(ofSize: 15)
        wordCountLabel.text = "COUNT"
        wordCountLabel.numberOfLines = 0
        wordCountLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(wordCountLabel)
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = UIFont.systemFont(ofSize: 28)
        answerLabel.text = "ANSWERS"
        answerLabel.numberOfLines = 0
        answerLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(answerLabel)
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            scoreLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 100),
            answerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            
            wordCountLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 10),
            wordCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: wordCountLabel.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

