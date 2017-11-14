//
//  ProfileViewModel.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class ProfileViewModel{
  var items: [ProfileViewModelItem] = []
  
  var profile: Profile?
  
  init(){
    guard let data = getDataFromFile("ServerData") else { return }
    
    if let profile = Profile(data: data){
      self.profile = profile
    }
  }
  
}
