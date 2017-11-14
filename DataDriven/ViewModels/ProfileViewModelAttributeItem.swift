//
//  ProfileViewModelAttributeItem.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModelAttributeItem: ProfileViewModelItem{
  
  var type: ProfileViewModelItemType {
    return .attribute
  }
  var sectionTitle: String {
    return "Attributes"
  }
  
  var rowCount: Int {
    return attributes.count
  }
  
  var attributes: [Attribute]
  
  init(attributes: [Attribute]) {
    self.attributes = attributes
  }
  
}
