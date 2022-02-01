//
//  PopularQuestionsViewController.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import UIKit

class PopularQuestionsViewController: UIViewController {

    //MARK: - Properties
    var router: PopularQuestionsRouter!
    var viewModel: PopularQuestionsViewModel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        fetchQuestions()
    }
    
    //MARK: - Private API
    private func setup() {
        navigationItem.title = "Popular Questions"
    }
    
    private func fetchQuestions() {
        viewModel.fetchQuestions { error in
            print("adsfb")
        }
    }
}

extension PopularQuestionsViewController: StoryboardInstance {
    static var storyboardName: StoryboardName = .popularQuestions
}
