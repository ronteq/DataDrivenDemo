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
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "mainCell")
    return tv
  }()
  
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
  
  
  
}

//MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
    cell.textLabel?.text = "daniel"
    return cell
  }
  
}
