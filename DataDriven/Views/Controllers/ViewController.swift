//
//  ViewController.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  fileprivate lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.delegate = self
    tv.dataSource = self
    tv.allowsSelection = false
    tv.register(NameAndPictureCell.self, forCellReuseIdentifier: Identifiers.nameAndPictureCell)
    tv.register(AboutCell.self, forCellReuseIdentifier: Identifiers.aboutCell)
    tv.register(EmailCell.self, forCellReuseIdentifier: Identifiers.emailCell)
    tv.register(AttributeCell.self, forCellReuseIdentifier: Identifiers.attributeCell)
    tv.register(FriendCell.self, forCellReuseIdentifier: Identifiers.friendCell)
    return tv
  }()
  
  var viewModel: ProfileViewModel!
  var friendItem: ProfileViewModelItem?
  
}

//MARK: Life cycle

extension ViewController{
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initialSetup()
  }

  
}

//MARK: Initial setup

extension ViewController{
  
  fileprivate func initialSetup(){
    view.backgroundColor = .white
    navigationItem.title = "Home"
    setupViews()
  }
  
  fileprivate func setupViews(){
    setupTableView()
  }
  
  fileprivate func setupTableView(){
    view.addSubview(tableView)
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
}

//MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return viewModel.itemIn(section: section).sectionTitle
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let item = viewModel.itemIn(section: indexPath.section)
    
    switch item.type{
    case .nameAndPicture: return 100
    case .friend: return ConstraintConstants.friendCellHeight
    default: return 50
    }
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let friendCell = cell as? FriendCell else { return }
    friendCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
  }
  
}

//MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsIn(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let item = viewModel.itemIn(section: indexPath.section)
    
    switch item.type{
    case .nameAndPicture:
      let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.nameAndPictureCell, for: indexPath) as! NameAndPictureCell
      cell.item = item
      return cell
      
    case .about:
      let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.aboutCell, for: indexPath) as! AboutCell
      cell.item = item
      return cell
      
    case .email:
      let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.emailCell, for: indexPath) as! EmailCell
      cell.item = item
      return cell
      
    case .friend:
      let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.friendCell, for: indexPath) as! FriendCell
//      use this when friendCell is just a UITableViewCell without collectionview inside
//      cell.index = indexPath.row
//      cell.item = item
      friendItem = item
      return cell
      
    case .attribute:
      let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.attributeCell, for: indexPath) as! AttributeCell
      cell.index = indexPath.row
      cell.item = item
      return cell
    }
  }
  
}

//MARK: UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate{
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let friendItem = friendItem as? ProfileViewModelFriendsItem else { return }
    print(friendItem.friends[indexPath.item].name ?? "") //I CAN GET ID FOR A DETAIL CONTROLLER
  }
  
}

extension ViewController: UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: ConstraintConstants.friendCellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0)
  }
  
}

//MARK: UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let profileViewModelFriendsItem = friendItem as? ProfileViewModelFriendsItem else { return 0 }
    return profileViewModelFriendsItem.friends.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.friendCollectionCell, for: indexPath) as! CollectionFriendCell
    
    if let item = friendItem{
      cell.index = indexPath.item
      cell.item = item
    }
    
    return cell
  }
  
}

//MARK: Constants

extension ViewController{
  
  struct Identifiers{
    static let nameAndPictureCell = "nameAndPictureCell"
    static let aboutCell = "aboutCell"
    static let emailCell = "emailCell"
    static let attributeCell = "attributeCell"
    static let friendCell = "friendCell"
    static let friendCollectionCell = "friendCollectionCell"
  }
  
  struct ConstraintConstants{
    static let friendCellHeight: CGFloat = 120
  }
  
}
