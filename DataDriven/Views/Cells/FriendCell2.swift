//
//  FriendCell2.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class FriendCell2: UITableViewCell{
  
  fileprivate let pictureImageView: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    iv.layer.cornerRadius = 40
    iv.clipsToBounds = true
    return iv
  }()
  
  fileprivate let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkGray
    return label
  }()
  
  var item: ProfileViewModelItem?{
    didSet{
      fillUI()
    }
  }
  
  var index: Int?
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Error coder on NameAndPictureCell")
  }
  
  fileprivate func setupViews(){
    addSubview(pictureImageView)
    addSubview(nameLabel)
    
    pictureImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    pictureImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    pictureImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    pictureImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: 16).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  fileprivate func fillUI(){
    guard let item = item as? ProfileViewModelFriendsItem,
      let index = index else { return }
    
    nameLabel.text = item.getName(for: index)
    pictureImageView.image = UIImage(named: item.getPictureUrl(for: index))
  }
  
}
