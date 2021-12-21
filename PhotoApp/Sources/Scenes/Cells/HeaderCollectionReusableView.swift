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
        return label
    }()
    
    private lazy var lookAllLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Все", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.textColor = .systemBlue
        label.numberOfLines = 1
        return label
    }()
    
//    private lazy var separatorView: UIView = {
//        let separator = UIView()
//        separator.layer.borderWidth = 0.5
//        separator.layer.borderColor = UIColor.gray.cgColor
//        return separator
//    }()
    
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
        
        [titlelLabel, lookAllLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
//            separatorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
//            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7),
//            separatorView.heightAnchor.constraint(equalToConstant: 1),
//            separatorView.widthAnchor.constraint(equalToConstant: 1500),
            
            titlelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titlelLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7),
            
            lookAllLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            lookAllLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
