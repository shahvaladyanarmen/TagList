//
//  PopularQuestionsViewModel.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

class PopularQuestionsViewModel {
    
    //MARK: - Properties
    let tag: Tag
    private(set) var questions: [Question] = []
    private let provider = Provider<QuestionsEndPoint>()
    
    //MARK: - Life Cycle
    init(tag: Tag) {
        self.tag = tag
    }
    
    //MARK: - Public API
    func fetchQuestions(completion: @escaping (TagListError?) -> Void) {
        provider.request(target: .questions(tag, 0, 0),
                             type: [Question].self) { [weak self] (questions, error) in
            guard let self = self else { return }
            if let error = error {
                completion(.unknown(error.message))
            } else if let questions = questions {
                self.questions = questions
                completion(nil)
            } else {
                completion(.tagsIsNil)
            }
        }
    }
}
