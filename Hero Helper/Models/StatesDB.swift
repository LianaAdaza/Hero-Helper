//
//  StatesDB.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class State: NSObject {
    var stateName: String = ""
    var stateAbbreviation : String = ""
    
    init(stateName: String, stateAbbreviation: String) {
        self.stateName = stateName
        self.stateAbbreviation = stateAbbreviation
    }
}

final class StatesDB {
    static let sharedInstance = StatesDB ()
    
    private init () {
        // Prevent unauthorized initialization
    }
    
    var states: [State] = [
        State(stateName: "Alabama", stateAbbreviation: "AL"),
        State(stateName: "Alaska", stateAbbreviation: "AK"),
        State(stateName: "Arizona", stateAbbreviation: "AZ"),
        State(stateName: "Arkansas", stateAbbreviation: "AR"),
        State(stateName: "California", stateAbbreviation: "CA"),
        State(stateName: "Colorado", stateAbbreviation: "CO"),
        State(stateName: "Connecticut", stateAbbreviation: "CT"),
        State(stateName: "Delaware", stateAbbreviation: "DE"),
        State(stateName: "Florida", stateAbbreviation: "FL"),
        State(stateName: "Georgia", stateAbbreviation: "GA"),
        State(stateName: "Hawaii", stateAbbreviation: "HI"),
        State(stateName: "Idaho", stateAbbreviation: "ID"),
        State(stateName: "Illinois", stateAbbreviation: "IL"),
        State(stateName: "Indiana", stateAbbreviation: "IN"),
        State(stateName: "Iowa", stateAbbreviation: "IA"),
        State(stateName: "Kansas", stateAbbreviation: "KS"),
        State(stateName: "Kentucky", stateAbbreviation: "KY"),
        State(stateName: "Louisiana", stateAbbreviation: "LA"),
        State(stateName: "Maine", stateAbbreviation: "ME"),
        State(stateName: "Maryland", stateAbbreviation: "MD"),
        State(stateName: "Massachusetts", stateAbbreviation: "MA"),
        State(stateName: "Michigan", stateAbbreviation: "MI"),
        State(stateName: "Minnesota", stateAbbreviation: "MN"),
        State(stateName: "Mississippi", stateAbbreviation: "MS"),
        State(stateName: "Missouri", stateAbbreviation: "MO"),
        State(stateName: "Montana", stateAbbreviation: "MT"),
        State(stateName: "Nebraska", stateAbbreviation: "NE"),
        State(stateName: "Nevada", stateAbbreviation: "NV"),
        State(stateName: "New Hampshire", stateAbbreviation: "NH"),
        State(stateName: "New Jersey", stateAbbreviation: "NJ"),
        State(stateName: "New Mexico", stateAbbreviation: "NM"),
        State(stateName: "New York", stateAbbreviation: "NY"),
        State(stateName: "North Carolina", stateAbbreviation: "NC"),
        State(stateName: "North Dakota", stateAbbreviation: "ND"),
        State(stateName: "Ohio", stateAbbreviation: "OH"),
        State(stateName: "Oklahoma", stateAbbreviation: "OK"),
        State(stateName: "Oregon", stateAbbreviation: "OR"),
        State(stateName: "Pennyslavania", stateAbbreviation: "PA"),
        State(stateName: "Rhode Island", stateAbbreviation: "RI"),
        State(stateName: "South Carolina", stateAbbreviation: "SC"),
        State(stateName: "South Dakota", stateAbbreviation: "SD"),
        State(stateName: "Tennessee", stateAbbreviation: "TN"),
        State(stateName: "Texas", stateAbbreviation: "TX"),
        State(stateName: "Utah", stateAbbreviation: "UT"),
        State(stateName: "Vermont", stateAbbreviation: "VT"),
        State(stateName: "Virginia", stateAbbreviation: "VA"),
        State(stateName: "Washington", stateAbbreviation: "WA"),
        State(stateName: "West Virginia", stateAbbreviation: "WV"),
        State(stateName: "Wisconsin", stateAbbreviation: "WI"),
        State(stateName: "Wyoming", stateAbbreviation: "WY"),

    ]
    
//        let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennyslavania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming" ]
    
    func getStates() -> [State] {
        return states
    }
    
}
