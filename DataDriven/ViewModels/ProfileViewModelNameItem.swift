//
//  ProfileViewModelNameItem.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModelNameItem: ProfileViewModelItem{
  
  var type: ProfileViewModelItemType{
    return .nameAndPicture
  }
  
  var sectionTitle: String{
    return "Main Info"
  }
  
  var pictureUrl: String
  var userName: String
  
  init(pictureUrl: String, userName: String){
    self.pictureUrl = pictureUrl
    self.userName = userName
  }
  
}
