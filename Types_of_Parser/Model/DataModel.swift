//
//  DataModel.swift
//  Tong_Types_of_Parser
//
//  Created by Tong Yi on 5/17/20.
//  Copyright © 2020 Tong Yi. All rights reserved.
//

import Foundation

struct Entertainment: Codable
{
    var title: String
    var detail: String
    
    init(_ dataDict: [String: String])
    {
        title = dataDict["dataTitle"] ?? "Any Title"
        detail = dataDict["dataDetail"] ?? "Any Detail"
    }
    
    enum CodingKeys: String, CodingKey
    {
        case title
        case detail
    }
}
