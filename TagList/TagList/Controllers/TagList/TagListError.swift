//
//  TagListError.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

enum TagListError: Error {
    case tagsIsNil
    case unknown(String)
}

extension TagListError: Errorable {
    var message: String {
        switch self {
        case .tagsIsNil:
            return "Can not fetchTag list. Please try later!"
        case .unknown(let message):
            return message
        }
    }
}
