//
//  TypesOfMediaViewCell.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 18.01.2022.
//

import UIKit

class TypesOfMediaViewCell: UICollectionViewCell {
    
    static let identifier = "TypesOfMediaViewCell"
        
    public lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .systemBlue
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    public lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        icon.tintColor = .systemBlue
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    public lazy var arrowIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        icon.tintColor = .white
        icon.image = UIImage(systemName: "chevron.right")
        icon.tintColor = .gray
        icon.transform3D = CATransform3DMakeScale(0.5, 0.5, 0.5)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    public lazy var numOfPhoto: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .systemGray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
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
        [titleLabel, icon, numOfPhoto, arrowIcon].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -7),
            icon.widthAnchor.constraint(equalToConstant: 26),
            icon.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            numOfPhoto.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            numOfPhoto.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            arrowIcon.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            arrowIcon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            arrowIcon.widthAnchor.constraint(equalToConstant: 26),
            arrowIcon.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    func configure(model: PhotoOption) {
        titleLabel.text = model.title
        icon.image = model.image
        numOfPhoto.text = model.numberOfPhoto
    }
}

