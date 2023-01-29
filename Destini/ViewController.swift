//
//  ViewController.swift
//  Destini
//
//  Created by Vitali Martsinovich on 2023-01-29.
//

import UIKit

class ViewController: UIViewController {
        
   lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 10
       stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    

   lazy var backgroundView: UIImageView = {
        
        let background = UIImageView()
        background.image = #imageLiteral(resourceName: "background")
        background.frame = view.frame
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        
        return background
    }()
    
    lazy var storyLabel: UILabel = {
        
        let label = UILabel()
        label.text = "A story will be here soon..."
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    lazy var choice1Button: UIButton = {
        
        let choice1 = UIButton()
        choice1.setTitle("Choice 1", for: .normal)
        choice1.setImage(UIImage(named: "choice1Background"), for: .normal)
        choice1.setTitleColor(.white, for: .normal)
        choice1.titleLabel?.font = .systemFont(ofSize: 23)
        choice1.layer.cornerRadius = 10
        choice1.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        choice1.translatesAutoresizingMaskIntoConstraints = false
        return choice1
        
    }()
    
    lazy var choice2Button: UIButton = {
        
        let choice2 = UIButton()
        choice2.setImage(UIImage(named: "choice2Background"), for: .normal)
        choice2.setTitle("Choice 2", for: .normal)
        choice2.setTitleColor(.white, for: .normal)
        choice2.titleLabel?.font = .systemFont(ofSize: 23)
        choice2.layer.cornerRadius = 10
        choice2.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        choice2.translatesAutoresizingMaskIntoConstraints = false
        return choice2
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        addingToStack()
        setConstraints()
        
    }
    
    @objc func choiceMade(sender: UIButton) {
        
    }
    
    func addingToStack() {
        stackView.addArrangedSubview(storyLabel)
        stackView.addArrangedSubview(choice1Button)
        stackView.addArrangedSubview(choice2Button)
    }
    
    func setUI() {
        view.addSubview(backgroundView)
        view.addSubview(stackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            choice1Button.heightAnchor.constraint(equalToConstant: 100),
            choice2Button.heightAnchor.constraint(equalToConstant: 100)
                
        ])
    }
    
    
}

