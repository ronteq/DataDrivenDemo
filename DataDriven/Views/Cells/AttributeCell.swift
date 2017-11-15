//
//  AttributeCell.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell{
  
  fileprivate let leftLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkGray
    return label
  }()
  
  fileprivate let rightLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkGray
    return label
  }()
  
  var item: Attribute?{
    didSet{
      fillUI()
    }
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Error coder on AttributeCell")
  }
  
  fileprivate func setupViews(){
    addSubview(leftLabel)
    addSubview(rightLabel)
    
    leftLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    leftLabel.trailingAnchor.constraint(equalTo: rightLabel.leadingAnchor, constant: -16).isActive = true
    leftLabel.widthAnchor.constraint(equalTo: rightLabel.widthAnchor).isActive = true
    
    rightLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    rightLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 16).isActive = true
    rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  fileprivate func fillUI(){
    guard let item = item else { return }
    leftLabel.text = item.key
    rightLabel.text = item.value
  }
  
}
