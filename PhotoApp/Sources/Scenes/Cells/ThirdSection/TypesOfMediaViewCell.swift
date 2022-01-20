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
        return title
    }()
    
    public lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        icon.tintColor = .systemBlue
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
        return icon
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let descr = UILabel()
        descr.textColor = .systemGray
        
        return descr
    }()
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(icon)
        addSubview(descriptionLabel)
        addSubview(arrowIcon)
    }
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 26).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 26).isActive = true

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        arrowIcon.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        arrowIcon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        arrowIcon.widthAnchor.constraint(equalToConstant: 26).isActive = true
        arrowIcon.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    
    func configure(model: PhotoOption) {
        titleLabel.text = model.title
        icon.image = model.image
        descriptionLabel.text = model.numberOfPhoto
    }
}

