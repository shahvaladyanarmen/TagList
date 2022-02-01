//
//  ErrorMessage.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Foundation

enum ErrorMessage: Error {
    case queryNotProvided
    case userAlreadyExists
    case parseIssue
    case message(String?)
}

extension ErrorMessage: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .queryNotProvided: return ""
        case .userAlreadyExists: return ""
        case .parseIssue: return "Can not parse json"
        case .message(let string): return string ?? ""
        }
    }
}
