//
//  ProfileViewModeFriendsItem.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModeFriendsItem: ProfileViewModelItem{
  
  var type: ProfileViewModelItemType {
    return .friend
  }
  
  var sectionTitle: String {
    return "Friends"
  }
  
  var rowCount: Int {
    return friends.count
  }
  
  var friends: [Friend]
  
  init(friends: [Friend]) {
    self.friends = friends
  }
  
}
