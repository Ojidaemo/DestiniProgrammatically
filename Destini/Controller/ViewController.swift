//
//  ViewController.swift
//  Destini
//
//  Created by Vitali Martsinovich on 2023-01-29.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    let destiniView = DestiniView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        destiniView.delegateChoiseButton = self
        
        view.addSubview(destiniView)
        setupConstraints()
        updateUI()
        
    }
        
    //MARK: - Methods for navigation through the story
    
    func updateUI() {
        destiniView.storyLabel.text = storyBrain.getStoryTitle()
        destiniView.choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        destiniView.choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
    //MARK: - Methods for setting UI
    
    private func setupConstraints() {
        
        destiniView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            destiniView.topAnchor.constraint(equalTo: view.topAnchor),
            destiniView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            destiniView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            destiniView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: choiceButtonProtocol {
    func didPressChoise(sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
}
