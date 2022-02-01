//
//  FormDataTargetType.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Moya

protocol FormDataTargetType {
    /// The file data
    var data: Data { get }
    /// The name.
    var name: String { get }
    /// The file name.
    var fileName: String { get }
    /// The MIME type
    var mimeType: String { get }
}

extension FormDataTargetType {
    /// Form data for uploading
    var multipartBody: MultipartFormData { MultipartFormData(provider: .data(data), name: name, fileName: fileName, mimeType: mimeType) }
}
