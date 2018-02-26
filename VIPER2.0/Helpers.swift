//
//  Helpers.swift
//  VIPERtest
//
//  Created by Andres Felipe Ocampo Eljaiesk on 17/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit


public func dimeString(json : JSON, nombre : String?) -> String{
    guard let nombreDes = nombre else { return ""}
    if let stringResult = json[nombreDes].string{
        return stringResult
    }else{
        return ""
    }
    
}


public protocol ReuseIdentifier : class{
    static var defaultIdentifier : String { get }
}


public extension ReuseIdentifier where Self : UIView{
    static var defaultIdentifier : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
