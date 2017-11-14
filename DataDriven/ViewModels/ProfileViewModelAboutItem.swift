//
//  ProfileViewModelAboutItem.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModelAboutItem: ProfileViewModelItem{
  
  var type: ProfileViewModelItemType {
    return .about
  }
  var sectionTitle: String {
    return "About"
  }
  var about: String
  
  init(about: String) {
    self.about = about
  }
  
}
