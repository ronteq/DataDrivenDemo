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
  
  fileprivate let attributes: [Attribute]
  
  init(attributes: [Attribute]) {
    self.attributes = attributes
  }
  
  //MARK: Interface
  
  func getKey(for index: Int) -> String{
    return attributes[index].key ?? ""
  }
  
  func getValue(for index: Int) -> String{
    return attributes[index].value ?? ""
  }
  
}
