//
//  TagListViewModel.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

class TagListViewModel {
    
    //MARK: - Properties
    private(set) var tagList: [Tag] = []
    private let provider = Provider<TagsEndPoint>()
    
    //MARK: - Public API
    func fetchTagList(completion: @escaping (TagListError?) -> Void) {
        provider.request(target: .tagList,
                             type: [Tag].self) { [weak self] (tags, error) in
            guard let self = self else { return }
            if let error = error {
                completion(.unknown(error.message))
            } else if let tags = tags {
                self.tagList = tags
                completion(nil)
            } else {
                completion(.tagsIsNil)
            }
        }
    }
}
