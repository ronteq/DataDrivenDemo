//
//  Profile.swift
//  DataDriven
//
//  Created by Daniel Fernandez on 11/14/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class Profile{
  var fullName: String?
  var pictureUrl: String?
  var email: String?
  var about: String?
  var friends: [Friend] = []
  var profileAttributes: [Attribute] = []
  
  init?(data: Data){
    do{
      if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
        
        guard let body = json["data"] as? [String: Any] else { return nil }
        
        self.fullName = body["fullName"] as? String
        self.pictureUrl = body["pictureUrl"] as? String
        self.email = body["email"] as? String
        self.about = body["about"] as? String
        
        if let friends = body["friends"] as? [[String: Any]]{
          self.friends = friends.map { Friend(withDictionary: $0) }
        }
        
        if let profileAttributes = body["profileAttributes"] as? [[String: Any]]{
          self.profileAttributes = profileAttributes.map { Attribute(withDictionary: $0) }
        }
        
      }
    }catch{
      fatalError("Can't init with data")
    }
  }
}

class Friend{
  var name: String?
  var pictureUrl: String?
  
  init(withDictionary dictionary: [String: Any]) {
    self.name = dictionary["name"] as? String
    self.pictureUrl = dictionary["pictureUrl"] as? String
  }
}

class Attribute{
  var key: String?
  var value: String?
  
  init(withDictionary dictionary: [String: Any]) {
    self.key = dictionary["key"] as? String
    self.value = dictionary["value"] as? String
  }
}

func getDataFromFile(_ filename: String) -> Data?{
  guard let url = Bundle.main.url(forResource: "ServerData", withExtension: "json") else { return nil }
  
  do{
    let data = try Data(contentsOf: url)
    return data
  }catch{
    fatalError("Error getting data")
  }
  
  return nil
}
