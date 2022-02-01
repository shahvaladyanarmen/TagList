//
//  Configuration.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Alamofire
import Moya

/// Confige network
struct NetworkConfiguration {
    /// Logger for network
    /// - Default: Enable
    static let networkLogger = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
    /// Configuration for session manager
    static var sessionManager: Session {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return Alamofire.Session(configuration: configuration, startRequestsImmediately: false)
    }
    /// Block for application network indicator
    typealias NetworkIndicator = (NetworkActivityChangeType, TargetType) -> ()
    static var networkActivityIndicator: NetworkIndicator {
        return {(change: NetworkActivityChangeType, target: TargetType) in
            switch change {
            case .began:
                print("--- began ---")
            case .ended:
                print("--- ended ---")
            }
        }
    }
}
