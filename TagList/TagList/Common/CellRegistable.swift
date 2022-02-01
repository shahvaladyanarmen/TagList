//
//  CellRegistable.swift
//  CarSpot
//
//  Created by Armen Shahvaladyan on 28.05.21.
//

import UIKit

protocol CellRegistable: CellDequeueReusable { }

extension CellRegistable {
    
    static func register(table: UITableView) {
        table.register(UINib.init(nibName: String(describing: self), bundle: nil), forCellReuseIdentifier: String(describing: self))
    }
    
    static func register(collection: UICollectionView) {
        collection.register(UINib.init(nibName: String(describing: self), bundle: nil), forCellWithReuseIdentifier: String(describing: self))
    }
}
