//
//  CellDequeueReusable.swift
//  CarSpot
//
//  Created by Armen Shahvaladyan on 28.05.21.
//

import UIKit

protocol CellDequeueReusable { }

extension CellDequeueReusable {
    static func cell(table: UITableView, indexPath: IndexPath) -> Self {
        let cell = table.dequeueReusableCell(withIdentifier: String(describing: self), for: indexPath) as! Self
        return cell
    }
    
    static func cell(collection: UICollectionView, indexPath: IndexPath, reuseIdentifier: String = "") -> Self {
        let reuseIdentifier = reuseIdentifier.isEmpty ? String(describing: self) : reuseIdentifier
        let cell = collection.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Self
        return cell
    }
}
