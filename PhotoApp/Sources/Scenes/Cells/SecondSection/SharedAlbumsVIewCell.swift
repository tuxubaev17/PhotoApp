//
//  SharedAlbumsVIewCell.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 11.01.2022.
//

import UIKit

class SharedAlbumsVIewCell: AlbumCollectionViewCell {
    
    static let sharedIdentifier = "SharedAlbumsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupHierarchy() {
        [imageView, titleLabel, numOfPhoto].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    public override func configure(model: PhotoOption) {
        imageView.image = model.image
        titleLabel.text = model.title
        numOfPhoto.text = model.numberOfPhoto
    }
}
