//
//  Environment.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Foundation

enum Environments {
    enum Keys {
        enum Plist {
            static let rootURL = "Root URL"
            static let apiKey = "App Key"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let rootURL: URL = {
//        guard let rootURLstring = Environments.infoDictionary[Keys.Plist.rootURL] as? String else {
//            fatalError("Root URL not set in plist for this environment")
//        }
//        guard let url = URL(string: rootURLstring) else {
//            fatalError("Root URL is invalid")
//        }
//        if url.absoluteString.contains("dev") {
//            if let env = UserDefaults.standard.string(forKey: "currentEnvironment") {
                let envURL = Environment.development.baseURL //Environment(rawValue: env.lowercased())?.baseURL ?? Environment.development.baseURL
//                if let environmentURL = URL(string: envURL) {
//                    return environmentURL
//                }
//            }
//        }
//        return url
        
        return URL(string: envURL)!
    }()
    
    // MARK: - Plist values
    static let baseAPIURL: URL = {
        let rootURL = Environments.rootURL.absoluteString
        guard let baseAPIURL = URL(string: "\(rootURL)/api") else {
            fatalError("Root URL is invalid")
        }
        if rootURL.contains("dev") {
            if let env = UserDefaults.standard.string(forKey: "currentEnvironment") {
                let envURL = Environment(rawValue: env.lowercased())?.apiURL ?? Environment.development.apiURL
                if let environmentURL = URL(string: envURL) {
                    return environmentURL
                }
            }
        }
        return baseAPIURL
    }()
    
    static let apiKey: String = {
        guard let apiKey = Environments.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}

enum Environment: String {
    case live
    case staging
    case development
    case branch

    var baseURL: String {
        switch self {
        case .live: return "https://api.stackexchange.com"
        case .staging: return ""
        case .development: return "https://api.stackexchange.com"
        case .branch: return ""
        }
    }

    var apiURL: String {
        return "\(self.baseURL)/api"
    }

    // WebSocket URL
    var wssURL: String {
        switch self {
        case .live:
            return "wss://api.carspot.app/spot"
        case .staging:
            return ""
        case .development:
            return "wss://orders.dev.local.express"
        case .branch:
            return "wss://orders.dev.local.express"
        }
    }
}
