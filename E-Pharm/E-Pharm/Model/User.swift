//
//  User.swift
//  E-Pharm
//
//  Created by Mac-Mini_2021 on 12/04/2022.
//

import Foundation
struct User {
    internal init(_id: String? = nil, username: String? = nil, email: String? = nil, phone: String? = nil, password: String? = nil, isVerified: Bool? = nil) {
        self._id = _id
        self.username = username
        self.email = email
        self.phone = phone
        self.password = password
        self.isVerified = isVerified
        
    }
    
    
    var _id : String?
    var username : String?
    var email : String?
    var phone  : String?
    var password : String?
    var isVerified : Bool?
   
}
