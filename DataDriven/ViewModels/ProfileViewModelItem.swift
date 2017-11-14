//
//  ProfileViewModelItem.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

protocol ProfileViewModelItem{
  var type: ProfileViewModelItemType { get }
  var rowCount: Int { get }
  var sectionTitle: String{ get }
}

//Default values
extension ProfileViewModelItem{
  var rowCount: Int {
    return 1
  }
}
