//
//  TagListRouter.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import UIKit

enum TagListSegue {
    case popularQuestions(Tag)
}

protocol TagListRoutable: Routable where SegueType == TagListSegue, SourceType == TagListViewController {

}

struct TagListRouter: TagListRoutable {
    func perform(_ segue: TagListSegue, from source: TagListViewController) {
        switch segue {
        case .popularQuestions(let tag):
            let vc = PopularQuestionsRouter.createPopularQuestionsViewController(with: tag)
            source.navigationController?.pushViewController(vc, animated: true)    
        }
    }
}

extension TagListRouter {
    static func createTagListViewController() -> TagListViewController {
        let vc = TagListViewController.storyboardInstance
        vc.router = TagListRouter()
        vc.viewModel = TagListViewModel()
        
        return vc
    }
}
