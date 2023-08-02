//
//  UserModel.swift
//  JustoTest
//
//  Created by Alan Eduardo Benavides Lira on 01/08/23.
//

import Foundation

struct UserModel {
    let name, lastName, secondLastName, gender: String
    let age: Int
    let email, phone, street, city, state, country: String
    let largePicture, mediumPicture, thumbnailPicture: String
}

extension UserModel {
    init(_ response: UserResponse) {
        guard let result = response.results.first
        else {
            name = ""
            lastName = ""
            secondLastName = ""
            gender = ""
            age = 0
            email = ""
            phone = ""
            street = ""
            city = ""
            state = ""
            country = ""
            largePicture = ""
            mediumPicture = ""
            thumbnailPicture = ""
            return
        }
        name = result.name.title
        lastName = result.name.first
        secondLastName = result.name.last
        gender = result.gender
        age = result.dob.age
        email = result.email
        phone = result.phone
        street = "\(result.location.street.number) \(result.location.street.name)"
        city = result.location.city
        state = result.location.state
        country = result.location.country
        largePicture = result.picture.large
        mediumPicture = result.picture.medium
        thumbnailPicture = result.picture.thumbnail
    }
    
    func fullName() -> String {
        return "\(name) \(lastName) \(secondLastName)"
    }
    func shortAddress() -> String {
        return "\(street), \(country)"
    }
}
