//
//  AlbumCollectionViewCell.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 21.12.2021.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "AlbumCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
       }()

    lazy var titleLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.textColor = .gray
        return mainLabel
       }()

    lazy var numOfPhoto: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .darkGray
        return descriptionLabel
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
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
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
                   imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                   imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                   imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                   imageView.heightAnchor.constraint(equalToConstant: 180)
               ])

        NSLayoutConstraint.activate([
                   titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                   titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8.0)
               ])
        
        NSLayoutConstraint.activate([
                   numOfPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                   numOfPhoto.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24)
               ])
    }
    
    public func configure(model: PhotoOption) {
        imageView.image = model.image
        titleLabel.text = model.title
        numOfPhoto.text = model.numberOfPhoto
    }
}
