//
//  Routable.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import Foundation

protocol Routable {
    associatedtype SegueType
    associatedtype SourceType
    func perform(_ segue: SegueType, from source: SourceType)
}
