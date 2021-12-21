//
//  AlbumViewController.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 21.12.2021.
//

import UIKit

class AlbumViewController: UIViewController {

    let models = PhotoOption.getPhotoCell()
    let headers = HeaderOption.getHeaderCell()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: .none)
        self.navigationItem.leftBarButtonItem = addButton
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupHierarchy() {
    
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
    
    private func setupView() {
        title = "Альбомы"
    }
    
    private func getCompositionalLayout() -> UICollectionViewLayout {
                
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] (sectionIndex: Int, _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            return self?.createSectionFor(sectionIndex: sectionIndex)
                   

            })
        return layout
    }
    
    private func createSectionFor(sectionIndex: Int) -> NSCollectionLayoutSection {
        
        switch sectionIndex {
        case 0:
            return albumsSection()
        case 1:
            return albumsSection()
        case 2:
            return albumsSection()
        default:
            return albumsSection()
        }
        
    }
    
    private func albumsSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                               heightDimension: .fractionalHeight(1)),
            subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 45, trailing: 0)

        let forNestedGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(1)),
            subitems: [group])

        let nestedGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.96),
                                               heightDimension: .absolute(480)),
            subitem: forNestedGroup, count: 2)

        let section = NSCollectionLayoutSection(group: nestedGroup)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}

extension AlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath)  as! AlbumCollectionViewCell
        cell.configure(model: model)

        return cell
    }
}

extension AlbumViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
        view.title = headers[indexPath.section].headerTitle
        
        return view
    }
}

