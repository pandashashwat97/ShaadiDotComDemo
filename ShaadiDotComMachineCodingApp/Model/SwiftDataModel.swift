//
//  SwiftDataModel.swift
//  ShaadiDotComMachineCodingApp
//
//  Created by Shashwat Panda on 06/02/25.
//

import Foundation
import SwiftData

@Model
final class Profiles {
    
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var registered: Dob
    var cell: String
    @Attribute(.unique) var value: String
    var picture: Picture
    var nat: String
    var selectionStatus: String?
    
    init(gender: String, name: Name, location: Location, email: String, registered: Dob, cell: String, value: String, picture: Picture, nat: String){
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email
        self.registered = registered
        self.cell = cell
        self.value = value
        self.picture = picture
        self.nat = nat
    }
    
    convenience init(item: Results){
        self.init(
            gender: item.gender,
            name: item.name,
            location: item.location,
            email: item.email,
            registered: item.registered,
            cell: item.cell,
            value: item.id.value,
            picture: item.picture,
            nat: item.nat
        )
    }
}
