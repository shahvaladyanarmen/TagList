//
//  TagListViewController.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import UIKit

class TagListViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var router: TagListRouter!
    var viewModel: TagListViewModel!
    
    private var columnCount: CGFloat = 2
    private let minimumLineSpacing: CGFloat = 5
    private let minimumInteritemSpacing: CGFloat = 5
    private let sideInset: CGFloat = 10
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        fetchTagList()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if let collectionView = collectionView {
            columnCount = UIDevice.current.orientation == .landscapeRight || UIDevice.current.orientation == .landscapeLeft ? 4 : 2
            collectionView.collectionViewLayout.invalidateLayout()
            collectionView.reloadData()
        }
    }
    
    //MARK: - Private API
    private func setup() {
        navigationItem.title = "Tag List"
        
        TagCell.register(collection: collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    private func fetchTagList() {
        viewModel.fetchTagList { [weak self] (error) in
            guard let self = self else { return }
            if let error = error {
                self.showAlert(with: error)
            } else {
                self.collectionView.reloadData()
            }
        }
    }
}

extension TagListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TagCell.cell(collection: collectionView, indexPath: indexPath)
        let tag = viewModel.tagList[indexPath.item]
        cell.configure(with: tag)
        return cell
    }
}

extension TagListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (collectionView.bounds.width - (columnCount - 1) * minimumInteritemSpacing - (2 * sideInset)) / columnCount
        return CGSize(width: w, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
}

extension TagListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer {
            collectionView.deselectItem(at: indexPath, animated: false)
        }
        
        let tag = viewModel.tagList[indexPath.item]
        router.perform(.popularQuestions(tag), from: self)
    }
}

extension TagListViewController: StoryboardInstance {
    static var storyboardName: StoryboardName = .tagList
}
