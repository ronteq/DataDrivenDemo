//
//  CollectionFriendCell2.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/20/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class CollectionFriendCell: UICollectionViewCell{
  
  fileprivate let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .darkGray
    label.textAlignment = .center
    return label
  }()
  
  fileprivate let pictureImageView: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    iv.layer.cornerRadius = 40
    iv.clipsToBounds = true
    return iv
  }()
  
  var index: Int?
  
  var item: ProfileViewModelItem?{
    didSet{
      fillUI()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Error coder on CollectionFriendCell")
  }
  
  //MARK: Initial setup
  
  fileprivate func setupViews(){
    addSubview(pictureImageView)
    addSubview(nameLabel)
    
    pictureImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    pictureImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    pictureImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    pictureImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    nameLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 8).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  //MARK: Private methods
  fileprivate func fillUI(){
    guard let item = item as? ProfileViewModelFriendsItem else { return }
    guard let index = index else { return }
    nameLabel.text = item.getName(for: index)
    pictureImageView.image = UIImage(named: item.getPictureUrl(for: index))
  }
  
}
