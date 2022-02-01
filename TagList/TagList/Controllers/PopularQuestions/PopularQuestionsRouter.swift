//
//  PopularQuestionsRouter.swift
//  PopularQuestions
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import UIKit

enum PopularQuestionsSegue {
    
}

protocol PopularQuestionsRoutable: Routable where SegueType == PopularQuestionsSegue, SourceType == PopularQuestionsViewController {

}

struct PopularQuestionsRouter: PopularQuestionsRoutable {
    func perform(_ segue: PopularQuestionsSegue, from source: PopularQuestionsViewController) {
        
    }
}

extension PopularQuestionsRouter {
    static func createPopularQuestionsViewController(with tag: Tag) -> PopularQuestionsViewController {
        let vc = PopularQuestionsViewController.storyboardInstance
        vc.router = PopularQuestionsRouter()
        vc.viewModel = PopularQuestionsViewModel(tag: tag)
        
        return vc
    }
}
