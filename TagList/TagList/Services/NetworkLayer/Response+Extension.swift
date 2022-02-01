//
//  Response+Extension.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Moya

extension Response {
    func map(_ target: Moya.TargetType) throws -> URL {
        switch target.task {
        case let .downloadDestination(downloadDestination):
            if let httpResponse = response, let url = httpResponse.url {
                return downloadDestination(url, httpResponse).destinationURL
            }
        case let .downloadParameters(_, _, downloadDestination):
            if let httpResponse = response, let url = httpResponse.url {
                return downloadDestination(url, httpResponse).destinationURL
            }
        default:
            throw MoyaError.imageMapping(self)
        }
        throw MoyaError.imageMapping(self)
    }
    
    func mapObject<T: Codable>(_ type: T.Type, path: String? = nil) throws -> BaseResponse<T?> {
        do {
            return try JSONDecoder().decode(BaseResponse<T?>.self, from: try getJsonData(path))
        } catch {
            print(error.localizedDescription)
            throw MoyaError.jsonMapping(self)
        }
    }
    
    func mapArray<T: Codable>(_ type: T.Type, path: String? = nil) throws -> BaseResponse<[T]> {
        do {
            let data = try getJsonData(path)
            return try JSONDecoder().decode(BaseResponse<[T]>.self, from: data)
        } catch {
            print(error.localizedDescription)
            throw MoyaError.jsonMapping(self)
        }
    }
    
    private func getJsonData(_ path: String? = nil) throws -> Data {
        do {
            if var jsonObject = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                if let path = path {
                    if let dataObject = jsonObject["items"] as? [String: Any],
                       let specificObject = dataObject[path] {
                        jsonObject["items"] = specificObject
                        print(jsonObject)
                    }
                }
                return try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            }
            
            throw MoyaError.encodableMapping(ErrorMessage.parseIssue)
        } catch {
            print(error.localizedDescription)
            throw MoyaError.jsonMapping(self)
        }
    }
}
