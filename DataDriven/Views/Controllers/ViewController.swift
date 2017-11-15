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
    tv.register(NameAndPictureCell.self, forCellReuseIdentifier: Identifiers.nameAndPictureCell)
    tv.register(AboutCell.self, forCellReuseIdentifier: Identifiers.aboutCell)
    tv.register(EmailCell.self, forCellReuseIdentifier: Identifiers.emailCell)
    tv.register(AttributeCell.self, forCellReuseIdentifier: Identifiers.attributeCell)
    tv.register(FriendCell.self, forCellReuseIdentifier: Identifiers.friendCell)
    return tv
  }()
  
  var viewModel: ProfileViewModel!
  
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
    case .nameAndPicture, .friend: return 100
    default: return 50
    }
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
      cell.item = viewModel.friendIn(section: indexPath.section, row: indexPath.row)
      return cell
      
    case .attribute:
      let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.attributeCell, for: indexPath) as! AttributeCell
      cell.item = viewModel.attributeIn(section: indexPath.section, row: indexPath.row)
      return cell
    }
  }
  
}

//MARK: Constants

extension ViewController{
  
  fileprivate struct Identifiers{
    static let nameAndPictureCell = "nameAndPictureCell"
    static let aboutCell = "aboutCell"
    static let emailCell = "emailCell"
    static let attributeCell = "attributeCell"
    static let friendCell = "friendCell"
  }
  
}
