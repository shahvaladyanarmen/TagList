//
//  Tag.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

struct Tag: Codable {
    
    //MARK: - Properties
    let count: Int
    let name: String
    let isRequired: Bool
    let hasSynonyms: Bool
    let isModeratorOnly: Bool
    
    enum CodingKeys: String, CodingKey {
        case count, name
        case isRequired       = "is_required"
        case hasSynonyms      = "has_synonyms"
        case isModeratorOnly  = "is_moderator_only"
    }
}
