//
//  TagsEndPoint.swift
//  CarSpot
//
//  Created by Armen Shahvaladyan on 29.07.21.
//

import Moya

enum TagsEndPoint {
    case tagList
}

extension TagsEndPoint: MultiTargetType {
    var path: String {
        switch self {
        case .tagList:
            return "2.3/tag"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .tagList:
            return .get
        }
    }
    
    var parameters: Parameter {
        switch self {
        case .tagList:
            return ["site": "stackoverflow",
                    "page": 30]
        }
    }
    
    var task: Task {
        switch self {
        case .tagList:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
