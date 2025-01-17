//
//  CharacterCell.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 17.01.2025.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    static let identifier = "CharacterCell"
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.width)
        nameLabel.frame = CGRect(x: 5, y: contentView.frame.width + 5, width: contentView.frame.width - 10, height: 40)
    }
    
    func configure(with character: Character){
        nameLabel.text = character.name
        
        if let imageUrl = character.imageUrl, let url = URL(string: imageUrl){
            imageView.kf.setImage(with: url, placeholder: UIImage(systemName: "person.circle"))
        }
        
    }
    
}
