//
//  BaseResponse.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Foundation

struct CSError: Codable {
    let key: String
    let message: String
}

struct BaseResponse<T>: Encodable, Decodable where T: Codable {
//    var status: Int
//    var success: Bool
    var data: T?
//    var errors: [CSError]?
    
    enum CodingKeys: String, CodingKey {
        case data = "items"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        status = try container.decode(Int.self, forKey: .status)
//        errors = try? container.decode([CSError].self, forKey: .errors)
        data = try? container.decode(T.self, forKey: .data)
//        success = (try? container.decode(Bool.self, forKey: .success)) ?? false
    }
}

struct Empty: Codable {}
