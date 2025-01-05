//
//  University.swift
//  BreakingBad08
//
//  Created by ACC3611701 on 08/08/24.
//

import Foundation
struct University : Codable,Identifiable{
 
    
    var alpha_two_code : String?
    var web_pages : [String]?
    var country : String?
    var domains : [String]?
    var name : String?
    var state_province : String?
    
    enum CodingKeys: String, CodingKey {
            case state_province = "state-province"
            case name, domains, country,web_pages,alpha_two_code
        }
}
