//
//  File.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 19.05.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Foundation

struct File: FormDataTargetType {
    let data: Data
    let name: String
    let fileName: String
    let mimeType: String
        
    init(data: Data, name: String, fileName: String, mimeType: FileMimeType) {
        self.data = data
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType.title
    }
}

enum FileMimeType {
    case image
    
    var title: String {
        switch self {
        case .image:
            return "image/jpeg"
        }
    }
}
