//
//  ProfileViewModelEmailItem.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModelEmailItem: ProfileViewModelItem{
  
  var type: ProfileViewModelItemType {
    return .email
  }
  var sectionTitle: String {
    return "Email"
  }
  
  var email: String
  
  init(email: String) {
    self.email = email
  }
  
}
