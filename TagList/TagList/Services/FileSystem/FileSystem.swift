//
//  FileSystem.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

enum Directory: String {
    case download
    case contacts
}

class FileSystem {
    /// - Return: Created URL in Document directory
    static func directory(_ name: Directory) -> URL {
        return FileSystem.documentsDirectory.appendingPathComponent("\(name.rawValue)/")
    }

    static let documentsDirectory: URL = {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }()
    
    static let cacheDirectory: URL = {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }()
    
    static let pictureDirectory: URL = {
        return FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
    }()
    
    static let userDirectory: URL = {
        return FileManager.default.urls(for: .userDirectory, in: .userDomainMask)[0]
    }()
    
    static let downloadDirectory: URL = {
        return FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
    }()
    
    static func checkFileIsExist(_ filePath: URL) -> Bool {
        return FileManager.default.fileExists(atPath: filePath.path)
    }
}
