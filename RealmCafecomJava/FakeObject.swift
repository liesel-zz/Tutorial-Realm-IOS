//
//  FakeObject.swift
//  RealmCafecomJava
//
//  Created by Joel Backschat on 4/3/16.
//  Copyright © 2016 Joel Backschat. All rights reserved.
//

import Foundation
import RealmSwift

class FakeObject: Object {
    
    dynamic var id:Int = 0
    dynamic var nome:String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
// Specify properties to ignore (Realm won't persist these)
    
  override static func ignoredProperties() -> [String] {
    return []
  }

}
