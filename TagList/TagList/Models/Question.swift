//
//  Question.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

struct Question: Codable {
    
    //MARK: - Properties
    let title: String
    let answered: Bool
    let viewCount: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case answered  = "is_answered"
        case viewCount = "view_count"
    }
    
}
