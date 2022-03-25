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
    var lettersUsed = [String]()
    var currentWord = ""
    let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    
    var labelStr = "" {
        didSet {
            answerLabel.text = "\(labelStr)"
        }
    }
    
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
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
            buttonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
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
        
        loadWords()
    }
    
    @objc func letterTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        lettersUsed.append(buttonTitle)
        sender.isHidden = true
        
        var promptWord = ""
        
        for letter in currentWord {
            let strLetter = String(letter)
            
            if lettersUsed.contains(String(letter)) {
                promptWord += strLetter
            } else {
                promptWord += "?"
            }
        }
        
        if promptWord == labelStr {
//            errorMessage(title: "", message: "The letter you pressed is not in the word")
            score -= 1
        } else {
            labelStr = promptWord
            score += 1
        }

        if labelStr.contains("?") != true {
//            errorMessage(title: "Congrats!", message: "Next Level!")
            loadWords()
        }
    }
    
    @objc func loadWords() {
        if let wordFileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let wordContents = try? String(contentsOf: wordFileURL) {
                var words = wordContents.components(separatedBy: "\n")
                words.shuffle()
                
                currentWord = words.randomElement()!.uppercased()
                
            }
        }
        
        answerLabel.text = String(repeating: "?", count: currentWord.count)
        wordCountLabel.text = "\(currentWord.count) Letters"
        
        for button in letterButtons {
            button.isHidden = false
        }
        
        lettersUsed.removeAll()
    }
    
//    func errorMessage(title: String, message: String) {
//        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        self.present(ac, animated: true, completion: nil)
//
//        // Dismiss the alert for 1 second
//        let when = DispatchTime.now() + 1
//        DispatchQueue.main.asyncAfter(deadline: when){
//          ac.dismiss(animated: true, completion: nil)
//        }
//    }


}

