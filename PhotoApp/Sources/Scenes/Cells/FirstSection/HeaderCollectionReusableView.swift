//
//  HeaderCollectionReusableView.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 21.12.2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
  static let identifier = "headerView"
    
   private lazy var titlelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lookAllLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Все", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.textColor = .systemBlue
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var title: String? {
        didSet {
            titlelLabel.text = title
        }
    }
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
        addTopBorder(with: .gray, andWidth: 0.5)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    private func setupHierarchy() {
        self.addSubview(titlelLabel)
        self.addSubview(lookAllLabel)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            titlelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titlelLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7),
            
            lookAllLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            lookAllLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
