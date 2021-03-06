//
//  FlavorFactory.swift
//  BBSimpleCocoapods
//


//

import Foundation

class FlavorFactory {
  
  func flavorsFromPlistNamed(plistName: String, bundle: NSBundle = NSBundle.mainBundle()) -> [Flavor] {
    
    let path = bundle.pathForResource(plistName, ofType: "plist")!
    let data = NSData(contentsOfFile: path)!

    let options = NSPropertyListMutabilityOptions.Immutable;
    
    let array = try! NSPropertyListSerialization.propertyListWithData(data, options: options, format: nil) as! [[String: String]]
    return flavorsFromDictionaryArray(array)
  }
  
  func flavorsFromDictionaryArray(array: [[String: String]]) -> [Flavor] {
    
    var flavors: [Flavor] = []
    
    for dictionary in array {
      
      if let flavor = Flavor(dictionary: dictionary) {
        flavors.append(flavor)
      }
    }
    
    return flavors
  }
}
