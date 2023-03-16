//
//  AlbumsController.swift
//  photos-compositional-layout
//
//  Created by Zhuldyz Bukeshova on 16.03.2023.
//

import UIKit

class AlbumsController: UIViewController {
    
    private var model: [PhotosSections]?
    
    // MARK: - Outlets
    
    lazy var photoCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collection.register(AlbumHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: AlbumHeaderReusableView.identifier)
        collection.register(MyAlbumsSectionCell.self, forCellWithReuseIdentifier: MyAlbumsSectionCell.identifier)
        collection.register(SharedAlbumsSectionCell.self, forCellWithReuseIdentifier: SharedAlbumsSectionCell.identifier)
        collection.register(TableSectionCell.self, forCellWithReuseIdentifier: TableSectionCell.identifier)
        return collection
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
        
        model = PhotosSections.albumSections
        
        setupNavigationBar()
        setupCollection()
    }
    
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(photoCollection)
    }
    
    private func setupLayout() {
        photoCollection.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.bottom.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1/2.5)
                )
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 5,
                                                                   trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2.15),
                                                       heightDimension: .absolute(500)
                )
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem, count: 2
                )
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                      leading: 10,
                                                                      bottom: 20,
                                                                      trailing: 10)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.98),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 5,
                                                                   trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/2.15),
                    heightDimension: .absolute(250)
                )
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                      leading: 10,
                                                                      bottom: 20,
                                                                      trailing: 10)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.98),
                    heightDimension: .estimated(40)
                )
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 0,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(43)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 10,
                                                                      bottom: 20,
                                                                      trailing: 0)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }

    // MARK: - Actions
    
    @objc func addPhotoAlbum() {
        print("Add")
    }
}

// MARK: - Extensions

extension AlbumsController {
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(addPhotoAlbum))
    }
}

extension AlbumsController {
    private func setupCollection() {
        self.photoCollection.dataSource = self
        self.photoCollection.delegate = self
    }
}

extension AlbumsController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?[section].photoAlbum.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photosSection = model?[indexPath.section] else { return UICollectionViewCell() }
        
        switch photosSection.type {
        case .myAlbumsSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsSectionCell.identifier, for: indexPath) as? MyAlbumsSectionCell
            guard let cell = cell else { return UICollectionViewCell()}
            let albumModel = photosSection.photoAlbum[indexPath.item]
            cell.configureAlbumTitle(albumModel.title)
            cell.configureImage(albumModel.image)
            cell.numberTitle.text = String(Int.random(in: 25...90))
            return cell
        case .sharedAlbumsSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SharedAlbumsSectionCell.identifier, for: indexPath) as? SharedAlbumsSectionCell
            guard let cell = cell else { return UICollectionViewCell()}
            let albumModel = photosSection.photoAlbum[indexPath.item]
            cell.configureAlbumTitle(albumModel.title)
            cell.configureImage(albumModel.image)
            return cell
        case .tableSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableSectionCell.identifier, for: indexPath) as? TableSectionCell
            guard let cell = cell else { return UICollectionViewCell()}
            let albumModel = photosSection.photoAlbum[indexPath.item]
            cell.configureIcon(albumModel.image)
            cell.configureTitle(albumModel.title)
            cell.numberTitle.text = String(Int.random(in: 80...120))
            if (indexPath.section == 2 && indexPath.item == 6) || (indexPath.section == 3 && indexPath.item == 2) {
                cell.bottomView.backgroundColor = UIColor.clear
            } else {
                cell.bottomView.backgroundColor = UIColor.systemGray5
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumHeaderReusableView.identifier, for: indexPath) as? AlbumHeaderReusableView
        guard let header = header else { return UICollectionReusableView()}
        let headerModel = model?[indexPath.section].header
        header.configureTitle(headerModel?.title)
        header.configureSubtitleButton(headerModel?.subtitle)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Button Pressed - \(model?[indexPath.section].photoAlbum[indexPath.item].title ?? "")")
    }
}
