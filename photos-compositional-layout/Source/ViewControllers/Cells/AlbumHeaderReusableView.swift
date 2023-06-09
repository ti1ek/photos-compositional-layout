//
//  AlbumHeaderReusableView.swift
//  photos-compositional-layout
//
//  Created by Zhuldyz Bukeshova on 16.03.2023.
//

import UIKit

class AlbumHeaderReusableView: UICollectionReusableView {
    
    static let identifier = "AlbumHeader"
    
    // MARK: - Outlets
    
    private lazy var topBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    lazy var subtitleButton: UIButton = {
        let subtitleButton = UIButton(type: .system)
        subtitleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        subtitleButton.setTitleColor(UIColor.systemBlue, for: .normal)
        return subtitleButton
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(topBorder)
        addSubview(title)
        addSubview(subtitleButton)
    }
    
    private func setupLayout() {
        
        topBorder.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
        
        title.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        
        subtitleButton.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.right.equalTo(self)
        }
    }
    
    // MARK: - Configuration
    
    func configureTitle(_ title: String?) {
        self.title.text = title
    }
    
    func configureSubtitleButton(_ subtitleButton: String?) {
        self.subtitleButton.setTitle(subtitleButton, for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        subtitleButton.setTitle(nil, for: .normal)
    }
}
