//
//  Provider.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Moya

final class Provider<T>: MoyaProvider<T> where T: MultiTargetType {
    typealias Target = T
    
    init() {
        super.init(endpointClosure: MoyaProvider.defaultEndpointMapping, requestClosure: MoyaProvider<Target>.defaultRequestMapping, stubClosure: MoyaProvider.neverStub, session: NetworkConfiguration.sessionManager, plugins: [NetworkActivityPlugin(networkActivityClosure: NetworkConfiguration.networkActivityIndicator), NetworkConfiguration.networkLogger], trackInflights: false)
    }
    
    func request<C>(target: Target, type: C.Type?, path: ResponsePath? = nil, callbackQueue: DispatchQueue? = .main, completion: @escaping (C?, CSError?) -> ()) where C: Codable {
        request(target, callbackQueue: callbackQueue) { result  in
            switch result {
            case .success(let response):
                do {
                    let responseData = try response.mapObject(C.self, path: path?.rawValue)
//                    if responseData.status == 401 || responseData.status == 403 {
//                        completion(nil, nil)
//                    } else {
//                        if responseData.status == 200, responseData.success {
                            if let data = responseData.data {
                                completion(data, nil)
                            } else {
                                completion(nil, CSError(key: "parseIssue", message: "Parse issue"))
                            }
//                        } else {
//                            completion(nil, responseData.errors?.first)
//                        }
//                    }
                } catch {
                    print(error.localizedDescription)
                    completion(nil, CSError(key: "parseIssue", message: "Parse issue"))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil, CSError(key: "", message: error.localizedDescription))
            }
        }
    }
    
    func request<C>(target: Target, type: [C].Type?, path: ResponsePath? = nil, callbackQueue: DispatchQueue? = .none, completion: @escaping ([C]?, CSError?) -> ()) where C: Codable {
        request(target, callbackQueue: callbackQueue) { result  in
            switch result {
            case .success(let response):
                do {
                    let responseData = try response.mapArray(C.self, path: path?.rawValue)
//                    if responseData.status == 401 || responseData.status == 403 {
//                        completion(nil, nil)
//                    } else {
//                        if responseData.status == 200, responseData.success {
                            completion(responseData.data, nil)
//                        } else {
//                            completion(nil, responseData.errors?.first)
//                        }
//                    }
                } catch {
                    print(error.localizedDescription)
                    completion(nil, CSError(key: "", message: error.localizedDescription))
                }
                print(response.statusCode)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil, CSError(key: "", message: error.localizedDescription))
            }
        }
    }
}
