//
//  DownloadTargetType.swift
//  iOCR
//
//  Created by Armen Shahvaladyan on 30.04.21.
//  Copyright © 2021 LEPartners. All rights reserved.
//

import Moya

protocol DownloadTargetType: TargetType { }

extension DownloadTargetType {
    /// Destination for downloaded file
    var downloadDestination: DownloadDestination {
        get {
            return { temporaryURL, response in
                let fileURL = FileSystem.directory(.download).appendingPathComponent(response.suggestedFilename ?? "\(Date().timeIntervalSince1970)")
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
            }
        }
    }
}
