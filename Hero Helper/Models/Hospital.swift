//
//  Hospital.swift
//  Hero Helper
//
//  Created by Leila Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

struct Hospital: Codable {
    var attributes: String?
    var NAME: String
    var STATE: String

    enum CodingKeys: String, CodingKey {
       case attributes
    }

    enum HospitalKeys: String, CodingKey {
        case NAME
        case STATE
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let hospital = try values.nestedContainer(keyedBy: HospitalKeys.self, forKey: .attributes)
        NAME = try hospital.decode(String.self, forKey: .NAME)
        STATE = try hospital.decode(String.self, forKey: .STATE)
    }
}

struct Hospitals: Codable {
    var features: [Hospital]
}
