//
//  Errorable.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

protocol Errorable: Error {
    var title: String { get }
    var message: String { get }
}

extension Errorable {
    var title: String {
        return "Attention!"
    }
}
