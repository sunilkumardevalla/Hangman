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
    let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
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
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
        
        let width = 75
        let height = 50

        var column = 0
        var row = 0

        for i in 0..<letters.count {
            let letterButton = UIButton(type: .system)
            letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            letterButton.setTitle("\(letters[i].uppercased())", for: .normal)
            letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)

            if i % 7 == 0 {
                column = 0
                row += 1
            }

            let frame = CGRect(x: column * height, y: row * height, width: width, height: height)
            letterButton.frame = frame

            buttonsView.addSubview(letterButton)
            letterButtons.append(letterButton)

            column += 1

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func letterTapped() {
        
    }


}

