//
//  QuestionsEndPoint.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Moya

enum QuestionsEndPoint {
    case questions(Tag, Int, Int)
}

extension QuestionsEndPoint: MultiTargetType {
    var path: String {
        switch self {
        case .questions:
            return "2.3/questions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .questions:
            return .get
        }
    }
    
    var parameters: Parameter {
        switch self {
        // TODO: Implement pagination @Armen Shahvaladyan.
        case let .questions(tag, limit, offset):
            return ["site": "stackoverflow",
                    "tagged": tag.name]
        }
    }
    
    var task: Task {
        switch self {
        case .questions:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
