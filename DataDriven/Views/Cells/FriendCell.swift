//
//  FriendCell.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/20/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell{
  
  fileprivate let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.alwaysBounceHorizontal = true
    cv.backgroundColor = .white
    cv.register(CollectionFriendCell.self, forCellWithReuseIdentifier: ViewController.Identifiers.friendCollectionCell)
    return cv
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Error coder on ComplexCell")
  }
  
  //MARK: Initial setup
  
  fileprivate func setupViews(){
    addSubview(collectionView)
  
    collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  //MARK: Internal methods
  
  func setCollectionViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>
    (dataSourceDelegate: D, forRow row: Int){
    
    collectionView.delegate = dataSourceDelegate
    collectionView.dataSource = dataSourceDelegate
    collectionView.tag = row
    collectionView.reloadData()
  }
  
}
