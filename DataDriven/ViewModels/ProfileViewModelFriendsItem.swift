//
//  ProfileViewModeFriendsItem.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModelFriendsItem: ProfileViewModelItem{
  
  var type: ProfileViewModelItemType {
    return .friend
  }
  
  var sectionTitle: String {
    return "Friends"
  }
  
  var rowCount: Int {
//    return friends.count
    return 1
  }
  
  let friends: [Friend]
  
  init(friends: [Friend]) {
    self.friends = friends
  }
  
  //MARK: Interface
  func getName(for index: Int) -> String{
    return friends[index].name ?? ""
  }
  
  func getPictureUrl(for index: Int) -> String{
    return friends[index].pictureUrl ?? ""
  }
  
}
