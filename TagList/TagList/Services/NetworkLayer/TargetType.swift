//
//  File.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Moya

protocol MultiTargetType: TargetType {
    var applicationKey: String { get }
    var parameters: Parameter { get }
    var mainParamaters: Parameter { get }
}

typealias Parameter = [String: Any]
typealias Header = [String: String]

extension MultiTargetType {
    var baseURL: URL {
        return Environments.rootURL
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var validationType: ValidationType {
        return .none
    }
    
    var applicationKey: String {
        return Environments.apiKey
    }
    
    var parameters: Parameter {
        return [:]
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var mainParamaters: Parameter {
        var params = parameters
        params["application_key"] = applicationKey
        print(["params": params])
        return ["params": params]
    }

    var headers: Header? {
        nil
    }
}
