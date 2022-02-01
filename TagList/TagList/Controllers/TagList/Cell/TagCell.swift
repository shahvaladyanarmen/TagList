//
//  TagCell.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import UIKit

class TagCell: UICollectionViewCell, CellRegistable {

    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var isRequiredLabel: UILabel!
    @IBOutlet weak var hasSynonymsLabel: UILabel!
    @IBOutlet weak var isModeratorOnlyLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
        containerView.layer.borderColor = UIColor.black.cgColor
    }
    
    //MARK: - Public API
    func configure(with tag: Tag) {
        nameLabel.text = tag.name
        countLabel.text = "Count is \(tag.count)"
        isRequiredLabel.text = "Required is \(tag.isRequired ? "On" : "Off")"
        hasSynonymsLabel.text = "\(tag.hasSynonyms ? "Has not Synonyms" : "Has Synonyms")"
        isModeratorOnlyLabel.text = "Moderator only is \(tag.isModeratorOnly ? "On" : "Off")"
    }
}
