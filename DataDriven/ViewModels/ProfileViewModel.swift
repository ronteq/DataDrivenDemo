//
//  ProfileViewModel.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModel{
  
  fileprivate var items: [ProfileViewModelItem] = []
  
  var numberOfSections: Int{
    return items.count
  }
  
  func numberOfRowsIn(section: Int) -> Int{
    return items[section].rowCount
  }
  
  func itemIn(section: Int) -> ProfileViewModelItem{
    return items[section]
  }
  
  init(){
    guard let data = getDataFromFile("ServerData") else { return }
    guard let profile = Profile(data: data) else { return }
    
    if let name = profile.fullName, let pictureUrl = profile.pictureUrl{
      let nameAndPictureItem = ProfileViewModelNameItem(pictureUrl: pictureUrl, userName: name)
      items.append(nameAndPictureItem)
    }
    
    if let about = profile.about{
      let aboutItem = ProfileViewModelAboutItem(about: about)
      items.append(aboutItem)
    }
    
    if let email = profile.email{
      let emailItem = ProfileViewModelEmailItem(email: email)
      items.append(emailItem)
    }
    
    let attributes = profile.profileAttributes
    
    if !attributes.isEmpty{
      let attributesItem = ProfileViewModelAttributeItem(attributes: attributes)
      items.append(attributesItem)
    }
    
    let friends = profile.friends
    
    if !friends.isEmpty{
      let friendsItem = ProfileViewModelFriendsItem(friends: friends)
      items.append(friendsItem)
    }
  }
  
}


