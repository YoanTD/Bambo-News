//
//  Sources.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 20/11/20.
//

import Foundation

struct SourcesList : Decodable {
    var status : String
    var sources : [FullSources]
    
}
