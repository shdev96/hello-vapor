//
//  File.swift
//  
//
//  Created by 이승희 on 11/18/23.
//

import Foundation
import Vapor

struct HotelQuery: Content {
    let sort : String
    let searchId : String?
}
