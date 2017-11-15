//
//  AboutCell.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell{
  
  fileprivate let aboutLabel: UILabel = {
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
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Error coder on EmailCell")
  }
  
  fileprivate func setupViews(){
    addSubview(aboutLabel)
    
    aboutLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    aboutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  fileprivate func fillUI(){
    guard let item = item as? ProfileViewModelAboutItem else { return }
    aboutLabel.text = item.about
  }
  
}
